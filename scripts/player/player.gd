class_name Player
extends CharacterBody2D


const MOVE_LEFT: StringName = "move_left"
const MOVE_RIGHT: StringName = "move_right"
const MOVE_UP: StringName = "move_up"
const MOVE_DOWN: StringName = "move_down"

@export var debug: bool = false

@export_category("Movement Settings")
@export var move_speed: float = 200.0
@export var accelaration: float = 5.0


func _physics_process(delta: float) -> void:
	_move_player(delta)
	move_and_slide()


func _move_player(delta: float) -> void:
	var direction: Vector2 = Input.get_vector(MOVE_LEFT, MOVE_RIGHT, MOVE_UP, MOVE_DOWN)
	var target_velocity: Vector2 = direction * accelaration
	velocity = velocity.lerp(target_velocity, 1 - exp(-25 * delta))
