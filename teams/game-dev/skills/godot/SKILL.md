---
name: godot
description: Godot Engine patterns, Node tree architecture, Signals, Resources, and GDScript/C# conventions
---

# Godot Development Skill

## Engine Detection
Look for: `project.godot`, `.tscn`, `.tres`, `.gd`, `.gdshader`, `addons/`, `export_presets.cfg`

## Project Structure
```
my_game/
  scenes/
    player/
      player.tscn
      player.gd
    enemies/
      enemy_base.tscn
      enemy_base.gd
    ui/
      hud.tscn
      main_menu.tscn
    levels/
      level_01.tscn
  scripts/
    autoloads/
      game_manager.gd
      audio_manager.gd
    resources/
      weapon_data.gd
    utilities/
      state_machine.gd
  assets/
    sprites/
    models/
    audio/
    fonts/
  addons/          # Third-party plugins
  project.godot
  export_presets.cfg
```

## Node Tree Architecture

Everything in Godot is a Node. Scenes are reusable node trees:

```gdscript
# player.gd - attached to the root node of player.tscn
extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var health_component = $HealthComponent

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
    # Called when node enters scene tree
    health_component.health_depleted.connect(_on_health_depleted)

func _physics_process(delta: float) -> void:
    # Called every physics frame (fixed timestep)
    if not is_on_floor():
        velocity.y += gravity * delta

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_velocity

    var direction = Input.get_axis("move_left", "move_right")
    velocity.x = direction * speed

    move_and_slide()

func _process(delta: float) -> void:
    # Called every frame (variable timestep)
    # Use for visual updates, input that doesn't affect physics
    pass

func _on_health_depleted() -> void:
    queue_free()
```

## Signals (Event System)

Signals are Godot's observer pattern for decoupled communication:

```gdscript
# Defining custom signals
signal health_changed(new_health: float)
signal died

# Emitting signals
func take_damage(amount: float) -> void:
    current_health -= amount
    health_changed.emit(current_health)
    if current_health <= 0:
        died.emit()

# Connecting signals (in code)
func _ready() -> void:
    # Connect to child node's signal
    $HealthComponent.health_changed.connect(_on_health_changed)
    # Connect with bind for extra data
    $Button.pressed.connect(_on_button_pressed.bind("confirm"))

# Connecting signals (in editor)
# Use the Node > Signals panel to connect visually
```

## Resources (Data-Driven Design)

Custom Resources are Godot's equivalent of ScriptableObjects:

```gdscript
# weapon_data.gd
class_name WeaponData
extends Resource

@export var weapon_name: String = ""
@export var damage: int = 10
@export var attack_speed: float = 1.0
@export var range: float = 100.0
@export var projectile_scene: PackedScene
@export var attack_sound: AudioStream
```

Usage:
```gdscript
# weapon_controller.gd
extends Node2D

@export var weapon_data: WeaponData

func attack() -> void:
    var projectile = weapon_data.projectile_scene.instantiate()
    projectile.damage = weapon_data.damage
    get_tree().current_scene.add_child(projectile)
```

## State Machine Pattern

```gdscript
# state_machine.gd
class_name StateMachine
extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready() -> void:
    for child in get_children():
        if child is State:
            states[child.name.to_lower()] = child
            child.transitioned.connect(_on_state_transitioned)
    if initial_state:
        initial_state.enter()
        current_state = initial_state

func _process(delta: float) -> void:
    if current_state:
        current_state.update(delta)

func _physics_process(delta: float) -> void:
    if current_state:
        current_state.physics_update(delta)

func _on_state_transitioned(state: State, new_state_name: String) -> void:
    if state != current_state:
        return
    var new_state = states.get(new_state_name.to_lower())
    if new_state:
        current_state.exit()
        new_state.enter()
        current_state = new_state
```

```gdscript
# state.gd
class_name State
extends Node

signal transitioned(state: State, new_state_name: String)

func enter() -> void:
    pass

func exit() -> void:
    pass

func update(delta: float) -> void:
    pass

func physics_update(delta: float) -> void:
    pass
```

## Autoloads (Singletons)

Register in Project > Project Settings > Autoload:

```gdscript
# game_manager.gd (autoload)
extends Node

signal game_paused
signal game_resumed

var score: int = 0
var is_paused: bool = false

func pause_game() -> void:
    is_paused = true
    get_tree().paused = true
    game_paused.emit()

func resume_game() -> void:
    is_paused = false
    get_tree().paused = false
    game_resumed.emit()
```

## Key Rules

1. **Use @onready for child node references** - `@onready var sprite = $Sprite2D`
2. **Use @export for inspector-exposed properties** - Type-safe, visible in editor
3. **Use signals for decoupled communication** - Never reach up the tree
4. **Use _physics_process for physics** - Fixed timestep, use for movement
5. **Use _process for visuals** - Variable timestep, use for animation/UI
6. **Use class_name for custom types** - Enables type hints and editor integration
7. **Use Resources for shared data** - Not nodes, lighter weight
8. **Use queue_free() to destroy nodes** - Safe deferred deletion
9. **Use groups for batch operations** - `get_tree().get_nodes_in_group("enemies")`
10. **Use Tweens for animations** - `create_tween().tween_property(self, "position", target, 0.5)`

## Common Anti-Patterns

- `get_node()` with long paths - use @onready or signals instead
- `find_child()` in _process - cache references
- Not using typed arrays and dictionaries - `var items: Array[Item] = []`
- Modifying node tree during iteration - use `call_deferred()`
- Using `get_tree().reload_current_scene()` without cleanup

## GDScript Style Guide

- `snake_case` for functions and variables
- `PascalCase` for classes and nodes
- `SCREAMING_SNAKE_CASE` for constants
- Prefix private members with underscore: `_private_var`
- Use type hints everywhere: `func attack(target: Enemy) -> int:`
- Use `StringName` for frequently compared strings: `&"idle"`
