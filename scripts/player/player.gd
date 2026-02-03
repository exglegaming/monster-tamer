class_name Player
extends CharacterBody2D


const MOVE_LEFT: StringName = "move_left"
const MOVE_RIGHT: StringName = "move_right"
const MOVE_UP: StringName = "move_up"
const MOVE_DOWN: StringName = "move_down"
const WALK_LEFT: StringName = "walk_left"
const WALK_RIGHT: StringName = "walk_right"
const WALK_UP: StringName = "walk_up"
const WALK_DOWN: StringName = "walk_down"

@export var debug: bool = false

@export_category("Movement Settings")
@export var move_speed: float = 200.0

var last_direction: Vector2 = Vector2.ZERO


@onready var character_animated_sprite: AnimatedSprite2D = %CharacterAnimatedSprite


func _physics_process(_delta: float) -> void:
	_move_player()
	move_and_slide()


func _move_player() -> void:
	var direction: Vector2 = Input.get_vector(MOVE_LEFT, MOVE_RIGHT, MOVE_UP, MOVE_DOWN)
	velocity = direction * move_speed

	if direction != Vector2.ZERO:
		last_direction = direction
	
	_update_animation(last_direction)

	
func _update_animation(dir: Vector2) -> void:
	if velocity != Vector2.ZERO:
		if dir.x > 0:
			character_animated_sprite.play(WALK_RIGHT)
		elif dir.x < 0:
			character_animated_sprite.play(WALK_LEFT)
		elif dir.y < 0:
			character_animated_sprite.play(WALK_UP)
		elif dir.y > 0:
			character_animated_sprite.play(WALK_DOWN)
	else:
		character_animated_sprite.stop()
