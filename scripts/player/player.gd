class_name Player
extends CharacterBody2D


const MOVE_LEFT: StringName = "move_left"
const MOVE_RIGHT: StringName = "move_right"
const MOVE_UP: StringName = "move_up"
const MOVE_DOWN: StringName = "move_down"

@export var debug: bool = false
@export_category("Movement Settings")
@export var move_speed: float = 200.0

var last_direction: Vector2 = Vector2.ZERO

@onready var character: AnimatedSprite2D = %AnimatedSprite2D
@onready var visuals: Node2D = $Visuals


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
	if dir != Vector2.ZERO:
		if dir.x > 0.1:
			visuals.scale.x = 1.0
			character.play(MOVE_RIGHT)
		elif dir.x < -0.1:
			visuals.scale.x = -1.0
		elif dir.y < -0.1:
			character.play(MOVE_UP)
		elif dir.y > 0.1:
			character.play(MOVE_DOWN)
	else:
		character.stop()
