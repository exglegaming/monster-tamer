class_name Monster
extends Resource


@export var id_number: int
@export var name: String
@export_enum("Fire", "Water", "Ground", "Electric", "Flying", "Grass") var type: String
@export var back_image: Texture2D
@export var level: int = 1
@export var experience_points: float = 0.0
@export var health: float = 10.0
@export var attack_stat: float = 1.0
@export var defense_stat: float = 1.0
@export var speed: float = 1.0
@export var moveset: Array = [] # May move this to its own resource but not sure yet
@export var has_evolution: bool = false
@export var is_caught: bool = false
