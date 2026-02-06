---
name: orleans
description: Microsoft Orleans patterns for distributed game servers, Grains, Silos, persistence, and multiplayer game architecture
---

# Microsoft Orleans Game Server Skill

## Engine Detection
Look for: `.sln` with Orleans NuGet packages, `*Grain*.cs`, `*Silo*.cs`, `Microsoft.Orleans.*` in `.csproj`, `ISiloBuilder`, `IClusterClient`

## Project Structure
```
GameServer/
  GameServer.sln
  src/
    GameServer.Grains.Interfaces/    # Grain interfaces (shared)
      IPlayerGrain.cs
      IRoomGrain.cs
      IMatchGrain.cs
      ILeaderboardGrain.cs
    GameServer.Grains/               # Grain implementations
      PlayerGrain.cs
      RoomGrain.cs
      MatchGrain.cs
      LeaderboardGrain.cs
    GameServer.Silo/                 # Silo host configuration
      Program.cs
      SiloConfig.cs
    GameServer.Client/               # Client SDK / API gateway
      Program.cs
      Controllers/
        GameController.cs
    GameServer.Shared/               # Shared types and DTOs
      Models/
        PlayerState.cs
        MatchState.cs
        GameAction.cs
  tests/
    GameServer.Tests/
      PlayerGrainTests.cs
      MatchGrainTests.cs
```

## Grain Pattern (Virtual Actor)

Grains are the core abstraction. Each grain has a unique identity and is single-threaded:

```csharp
// Interface - GameServer.Grains.Interfaces/IPlayerGrain.cs
public interface IPlayerGrain : IGrainWithStringKey
{
    Task<PlayerState> GetState();
    Task JoinRoom(string roomId);
    Task LeaveRoom();
    Task<bool> TakeDamage(float amount, string attackerId);
    Task UpdatePosition(Vector3 position, Quaternion rotation);
}

// Implementation - GameServer.Grains/PlayerGrain.cs
public class PlayerGrain : Grain, IPlayerGrain
{
    private readonly IPersistentState<PlayerState> _state;
    private readonly ILogger<PlayerGrain> _logger;
    private IDisposable? _heartbeatTimer;

    public PlayerGrain(
        [PersistentState("player", "gameStore")]
        IPersistentState<PlayerState> state,
        ILogger<PlayerGrain> logger)
    {
        _state = state;
        _logger = logger;
    }

    public override async Task OnActivateAsync(CancellationToken ct)
    {
        _logger.LogInformation("Player {Id} activated", this.GetPrimaryKeyString());
        _heartbeatTimer = this.RegisterGrainTimer(
            Heartbeat, TimeSpan.FromSeconds(30), TimeSpan.FromSeconds(30));
        await base.OnActivateAsync(ct);
    }

    public override async Task OnDeactivateAsync(DeactivationReason reason, CancellationToken ct)
    {
        _heartbeatTimer?.Dispose();
        await _state.WriteStateAsync();
        await base.OnDeactivateAsync(reason, ct);
    }

    public Task<PlayerState> GetState() => Task.FromResult(_state.State);

    public async Task JoinRoom(string roomId)
    {
        var room = GrainFactory.GetGrain<IRoomGrain>(roomId);
        await room.AddPlayer(this.GetPrimaryKeyString());
        _state.State.CurrentRoomId = roomId;
        await _state.WriteStateAsync();
    }

    public async Task<bool> TakeDamage(float amount, string attackerId)
    {
        _state.State.Health -= amount;
        if (_state.State.Health <= 0)
        {
            _state.State.Health = 0;
            _state.State.IsAlive = false;
            await _state.WriteStateAsync();

            // Notify the room
            if (_state.State.CurrentRoomId is not null)
            {
                var room = GrainFactory.GetGrain<IRoomGrain>(_state.State.CurrentRoomId);
                await room.OnPlayerDeath(this.GetPrimaryKeyString(), attackerId);
            }
            return true; // Player died
        }
        await _state.WriteStateAsync();
        return false;
    }

    private Task Heartbeat()
    {
        _state.State.LastHeartbeat = DateTime.UtcNow;
        return _state.WriteStateAsync();
    }
}
```

## Room/Match Grain (Game Session)

```csharp
public interface IRoomGrain : IGrainWithStringKey
{
    Task AddPlayer(string playerId);
    Task RemovePlayer(string playerId);
    Task<RoomState> GetState();
    Task BroadcastAction(GameAction action);
    Task OnPlayerDeath(string playerId, string killerId);
}

public class RoomGrain : Grain, IRoomGrain
{
    private readonly IPersistentState<RoomState> _state;
    private readonly HashSet<string> _activePlayers = new();

    public RoomGrain(
        [PersistentState("room", "gameStore")]
        IPersistentState<RoomState> state)
    {
        _state = state;
    }

    public async Task AddPlayer(string playerId)
    {
        if (_activePlayers.Count >= _state.State.MaxPlayers)
            throw new InvalidOperationException("Room is full");

        _activePlayers.Add(playerId);
        _state.State.PlayerIds = _activePlayers.ToList();
        await _state.WriteStateAsync();

        // Notify all players
        await BroadcastAction(new GameAction
        {
            Type = "player_joined",
            PlayerId = playerId,
            Timestamp = DateTime.UtcNow
        });
    }

    public async Task BroadcastAction(GameAction action)
    {
        var tasks = _activePlayers.Select(async id =>
        {
            var player = GrainFactory.GetGrain<IPlayerGrain>(id);
            // Push via stream or polling
        });
        await Task.WhenAll(tasks);
    }
}
```

## Orleans Streams (Real-Time Updates)

```csharp
// Producer (in RoomGrain)
public async Task BroadcastGameState()
{
    var streamProvider = this.GetStreamProvider("GameStream");
    var stream = streamProvider.GetStream<GameStateUpdate>(
        StreamId.Create("room", this.GetPrimaryKeyString()));
    await stream.OnNextAsync(new GameStateUpdate
    {
        RoomId = this.GetPrimaryKeyString(),
        Players = _state.State.PlayerIds,
        Timestamp = DateTime.UtcNow
    });
}

// Consumer (in client or another grain)
var stream = streamProvider.GetStream<GameStateUpdate>(
    StreamId.Create("room", roomId));
await stream.SubscribeAsync((update, token) =>
{
    // Handle real-time game state update
    return Task.CompletedTask;
});
```

## Silo Configuration

```csharp
// Program.cs - Silo Host
var builder = Host.CreateDefaultBuilder(args)
    .UseOrleans((context, siloBuilder) =>
    {
        if (context.HostingEnvironment.IsDevelopment())
        {
            siloBuilder.UseLocalhostClustering();
            siloBuilder.AddMemoryGrainStorage("gameStore");
        }
        else
        {
            siloBuilder.UseAzureStorageClustering(options =>
                options.ConfigureTableServiceClient(connectionString));
            siloBuilder.AddAzureTableGrainStorage("gameStore", options =>
                options.ConfigureTableServiceClient(connectionString));
        }

        siloBuilder.AddMemoryStreams("GameStream");
        siloBuilder.UseDashboard(); // Orleans Dashboard for monitoring
    });
```

## Persistence Patterns

```csharp
// State class
[GenerateSerializer]
public class PlayerState
{
    [Id(0)] public string PlayerId { get; set; } = "";
    [Id(1)] public float Health { get; set; } = 100f;
    [Id(2)] public bool IsAlive { get; set; } = true;
    [Id(3)] public string? CurrentRoomId { get; set; }
    [Id(4)] public DateTime LastHeartbeat { get; set; }
    [Id(5)] public Dictionary<string, int> Inventory { get; set; } = new();
}

// Use [GenerateSerializer] and [Id(n)] for Orleans serialization
// Write state explicitly after mutations: await _state.WriteStateAsync()
// State is automatically loaded on grain activation
```

## Key Rules

1. **Grains are single-threaded** - No locks needed, but avoid blocking calls
2. **Use Task/async everywhere** - Never block with .Result or .Wait()
3. **Keep grain state small** - Large state = slow activation/persistence
4. **Use grain timers, not Task.Delay** - Timers are grain-lifecycle aware
5. **Dispose timers in OnDeactivateAsync** - Prevent leaks
6. **Use streams for real-time communication** - Not polling
7. **Persist state explicitly** - Call WriteStateAsync after mutations
8. **Use [GenerateSerializer]** - Not JSON serialization for grain state
9. **Design for grain deactivation** - Grains can deactivate at any time
10. **Use string or Guid keys** - Choose based on your identity model

## Common Anti-Patterns

- Storing client connections in grain state (not serializable)
- Calling .Result on Tasks inside grains (deadlock risk)
- Large grain state with full game world (partition into multiple grains)
- Not handling grain deactivation/reactivation cycles
- Using static state instead of grain state (lost on silo restart)

## Scaling Patterns

- **One grain per player** - Player state, inventory, progression
- **One grain per room/match** - Game session state, player list
- **One grain per world zone** - Spatial partitioning for large worlds
- **Stateless worker grains** - For CPU-intensive calculations (pathfinding, matchmaking)
- **Observer pattern** - Use IGrainObserver for push notifications to clients
