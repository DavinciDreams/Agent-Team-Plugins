---
name: gamedev-conventions
description: Cross-engine game development conventions and standards for the game-dev team
---

# Game Dev Team Conventions

## General

- Detect and follow the project's existing engine and code conventions
- Use delta time for all frame-rate-dependent calculations
- Implement object pooling for frequently spawned/destroyed objects
- Separate game data from game logic (data-driven design)
- Use events/signals for decoupled communication between systems
- Keep game state serializable for save/load support
- Profile before optimizing - measure, don't guess

## Performance Standards

- **Target frame rate**: Maintain target FPS (60 for action games, 30 for strategy)
- **Memory**: Minimize per-frame allocations, avoid GC spikes
- **Draw calls**: Batch where possible, use instancing for repeated geometry
- **Physics**: Use layer masks, limit raycast distances, prefer overlap checks over raycasts
- **Loading**: Use async loading, show progress, never block the main thread
- **Pooling**: Pool projectiles, particles, enemies, and any frequently created objects

## Code Organization

- One primary class/script per file
- Group files by system (Player/, Enemies/, UI/, Environment/, etc.)
- Keep scripts/components focused - single responsibility
- Use namespaces or folders to prevent naming collisions
- Separate editor tools from runtime code

## State Management

- Use finite state machines for entities with discrete states
- Implement proper enter/exit/update for each state
- Make state transitions explicit and traceable
- Handle edge cases (interrupted transitions, invalid states)
- Consider hierarchical state machines for complex entities

## Input Handling

- Abstract input from actions (don't check KeyCode directly)
- Support remapping and multiple input devices
- Handle simultaneous inputs correctly
- Implement input buffering for action games
- Test with keyboard, mouse, and gamepad

## Asset Conventions

- Use consistent naming: `PascalCase` for types, `camelCase` or `snake_case` per engine convention
- Textures: Power-of-2 dimensions, appropriate compression per platform
- Models: < 50K triangles for mobile, < 100K for desktop (per object)
- Audio: Use appropriate compression, implement spatial audio where needed
- Keep source assets separate from imported/processed assets

## Testing

- Test critical game systems (state machines, damage calculation, inventory)
- Write integration tests for complex interactions
- Automate repetitive playtesting with bots or scripts where possible
- Test edge cases: zero health, full inventory, boundary conditions
- Verify platform-specific behavior on target hardware

## Multiplayer (when applicable)

- Implement authoritative server (never trust the client)
- Minimize network bandwidth (delta compression, relevancy)
- Handle latency with prediction and reconciliation
- Test with simulated lag and packet loss
- Implement proper disconnect/reconnect handling

## Collaboration

- Each agent works within their defined scope
- Agents should not modify files outside their responsibility
- Engine-dev and gameplay-dev agree on system interfaces before implementation
- All changes must follow patterns found in the existing codebase
- Use the engine-specific skill as your primary reference
