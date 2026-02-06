---
name: engine-patterns
description: Cross-engine design pattern comparison for game development including ECS, state machines, networking, and common architectures
---

# Cross-Engine Design Patterns

A reference for implementing common game patterns across different engines. Use this when deciding on architecture or translating patterns between engines.

## Entity-Component-System (ECS)

How game objects are structured varies by engine:

| Engine | Model | Entity | Component | System |
|--------|-------|--------|-----------|--------|
| Unity | Component-Based | GameObject | MonoBehaviour | Manager scripts or DOTS Systems |
| Unreal | Actor-Component | AActor | UActorComponent | Tick functions or Subsystems |
| Godot | Node Tree | Node | Child Nodes | _process/_physics_process |
| Three.js | Scene Graph | Object3D | userData / custom classes | Game loop update functions |
| Orleans | Virtual Actor | Grain | Grain State / Interfaces | Grain methods + Timers |

**When to use full ECS**: Performance-critical systems with thousands of entities (Unity DOTS, custom ECS). For most gameplay, the engine's native component model is sufficient.

## State Machines

Every engine needs state machines for entities, game flow, and UI:

| Engine | Implementation |
|--------|---------------|
| Unity | ScriptableObject-based states, or Animator for simple cases |
| Unreal | Gameplay Ability System, or custom UObject state classes |
| Godot | Node-based states as children of StateMachine node |
| Three.js | TypeScript classes with enter/exit/update methods |
| Orleans | Grain state + explicit transitions in grain methods |

**Core pattern** (all engines):
```
State {
  enter()    // Called when entering this state
  exit()     // Called when leaving this state
  update(dt) // Called every frame while in this state
}

StateMachine {
  currentState: State
  transition(newState) {
    currentState.exit()
    newState.enter()
    currentState = newState
  }
}
```

## Observer/Event Pattern

Decoupled communication between systems:

| Engine | Mechanism |
|--------|-----------|
| Unity | C# events, UnityEvent, ScriptableObject event channels |
| Unreal | Delegates (DECLARE_DELEGATE), BlueprintAssignable events |
| Godot | Signals (built-in, first-class) |
| Three.js | EventDispatcher, custom EventEmitter, or RxJS |
| Orleans | Orleans Streams, IGrainObserver |

## Object Pooling

Avoid allocation/deallocation overhead for frequently created objects:

| Engine | Strategy |
|--------|----------|
| Unity | Queue<GameObject>, SetActive(true/false) |
| Unreal | FActorPoolingSystem or custom TArray<AActor*> pool |
| Godot | Array of nodes, set visible/process_mode |
| Three.js | Array of Object3D, toggle visible property |
| Orleans | Not applicable (grains are virtual, always "exist") |

**When to pool**: Projectiles, particles, enemies, VFX, UI elements - anything created/destroyed frequently during gameplay.

## Networking Models

| Engine | Built-in | Model |
|--------|----------|-------|
| Unity | Netcode for GameObjects, Mirror, FishNet | Server-authoritative, client prediction |
| Unreal | Built-in replication | Server-authoritative, property replication, RPCs |
| Godot | MultiplayerPeer, MultiplayerSynchronizer | Server-authoritative or peer-to-peer |
| Three.js | None (use WebSocket/WebRTC) | Custom, typically server-authoritative |
| Orleans | Built-in (virtual actors) | Server-authoritative by design |

**Core multiplayer principles**:
1. Server is authoritative - never trust client state
2. Client predicts locally for responsiveness
3. Server reconciles and corrects client state
4. Use delta compression to minimize bandwidth
5. Handle disconnection and reconnection gracefully

## Save/Load Patterns

| Engine | Strategy |
|--------|----------|
| Unity | JsonUtility or custom serialization to PlayerPrefs/files |
| Unreal | USaveGame with UGameplayStatics::SaveGameToSlot |
| Godot | ConfigFile or custom JSON/Resource serialization |
| Three.js | JSON serialization to localStorage or server API |
| Orleans | Built-in grain persistence (automatic with IPersistentState) |

## Input Abstraction

| Engine | System |
|--------|--------|
| Unity | New Input System (InputAction) or legacy Input class |
| Unreal | Enhanced Input System (UInputAction, UInputMappingContext) |
| Godot | InputMap with named actions, Input.is_action_pressed() |
| Three.js | Custom abstraction over DOM events (keyboard, mouse, gamepad API) |

**Best practice**: Map physical inputs to semantic actions ("jump", "attack", "interact"), never check raw keys in gameplay code.

## Audio Architecture

| Engine | System |
|--------|--------|
| Unity | AudioSource + AudioListener, FMOD/Wwise for complex projects |
| Unreal | Sound Cues, MetaSounds (UE5), Wwise integration |
| Godot | AudioStreamPlayer2D/3D, AudioBus system |
| Three.js | Three.js AudioListener + PositionalAudio, or Howler.js |

## Physics

| Engine | System | 2D | 3D |
|--------|--------|----|----|
| Unity | PhysX (3D), Box2D (2D) | Rigidbody2D, Collider2D | Rigidbody, Collider |
| Unreal | Chaos Physics | N/A (use Paper2D) | UPrimitiveComponent physics |
| Godot | GodotPhysics, Jolt | RigidBody2D, Area2D | RigidBody3D, Area3D |
| Three.js | None built-in | cannon-es, rapier2d | rapier3d, ammo.js |

## UI Architecture

| Engine | System | Technology |
|--------|--------|-----------|
| Unity | UGUI (Canvas) or UI Toolkit | C# + XML (UI Toolkit) or Inspector-based |
| Unreal | UMG (Unreal Motion Graphics) | Blueprints + Slate (C++) |
| Godot | Control nodes (built-in) | Theme resources + GDScript |
| Three.js | HTML/CSS overlay or drei/Html | React components or DOM |

## Pattern Selection Guide

**For new projects, consider**:
- Start with the engine's native patterns before adding frameworks
- Only add ECS when you have measurable performance needs
- Use the engine's built-in networking before rolling your own
- Prefer data-driven design for anything designers need to tune
- Keep architecture as simple as possible for the game's actual needs
