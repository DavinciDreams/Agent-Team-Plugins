# Game Dev Team

Multi-engine game development team with 6 specialist agents covering **Unity**, **Unreal Engine**, **Godot**, **Three.js/R3F**, and **Microsoft Orleans** distributed game servers.

## Agents

| Agent | Role | Phase | Color |
|-------|------|-------|-------|
| gamedev-code-explorer | Codebase Analyst | discovery | yellow |
| gamedev-engine-dev | Engine & Systems Programmer | execution | green |
| gamedev-gameplay-dev | Gameplay & Mechanics Programmer | execution | cyan |
| gamedev-level-designer | Level/Scene/World Designer | execution | magenta |
| gamedev-asset-pipeline | Asset Pipeline & Build Engineer | execution | blue |
| gamedev-qa-tester | QA & Playtesting Engineer | review | red |

## Supported Engines

| Engine | Language | Skill | MCP Server |
|--------|----------|-------|------------|
| Unity | C# | `skills/unity/` | `@anthropic/mcp-unity` (disabled by default) |
| Unreal Engine | C++/Blueprints | `skills/unreal/` | See note below |
| Godot | GDScript/C# | `skills/godot/` | `gdai-mcp-server` (disabled by default) |
| Three.js/R3F | TypeScript | `skills/threejs/` | N/A |
| Microsoft Orleans | C# | `skills/orleans/` | N/A |

### MCP Server Notes

Optional MCP servers are pre-configured in `.mcp.json` but disabled by default. Enable the ones you need:

- **Unity**: `@anthropic/mcp-unity` - Provides scene inspection, component queries, and asset management. Based on [CoderGamester/mcp-unity](https://github.com/CoderGamester/mcp-unity).
- **Godot**: `gdai-mcp-server` - Provides scene tree inspection and node manipulation. Based on [3ddelano/gdai-mcp-plugin-godot](https://github.com/3ddelano/gdai-mcp-plugin-godot).
- **Unreal**: No standardized MCP server yet. See [chongdashu/unreal-mcp](https://github.com/chongdashu/unreal-mcp) for experimental support.

To enable an MCP server, edit `.mcp.json` and set `"disabled": false`.

## Workflows

| Workflow | Phases | Use Case |
|----------|--------|----------|
| feature | discovery > planning > execution > review > summary | New game features |
| mechanic | discovery > planning > execution > review > summary | New gameplay mechanics |
| bugfix | discovery > execution > review | Bug fixes |
| optimization | discovery > execution > review | Performance optimization |

## Skills

| Skill | Description |
|-------|-------------|
| `gamedev-conventions` | Cross-engine standards (performance, delta time, pooling, disposal) |
| `unity` | Unity patterns, lifecycle, ScriptableObjects, DOTS, Addressables |
| `unreal` | Unreal patterns, Actor/Component, Blueprints vs C++, GAS |
| `godot` | Godot patterns, Node tree, Signals, Resources, GDScript |
| `threejs` | Three.js/R3F patterns, scene graph, disposal, useFrame |
| `orleans` | Orleans distributed game servers, Grains, Silos, persistence |
| `engine-patterns` | Cross-engine design pattern comparison (ECS, state machines, networking) |

## Usage

```bash
# Install the team
claude plugin install game-dev

# Start a game dev task
/game-dev:gamedev Implement a player movement controller with wall jumping in Unity

# Check team status
/game-dev:status
```

## Examples

```
/game-dev:gamedev Add enemy AI with patrol and chase behavior using Godot's NavigationAgent3D
/game-dev:gamedev Build a multiplayer lobby system with Orleans grains for matchmaking
/game-dev:gamedev Create a procedural terrain generator with Three.js and R3F
/game-dev:gamedev Implement GAS-based ability system for a mage character in Unreal
/game-dev:gamedev Optimize draw calls and implement LOD system for our open world Unity scene
```
