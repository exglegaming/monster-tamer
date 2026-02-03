class_name Monster
extends Resource


@export var id_number: int
@export var name: String
@export_enum("Fire", "Water", "Ground", "Electric", "Flying", "Grass") var type: String
@export var image: Texture2D
@export var level: int
@export var experience_points: float
@export var health: float
@export var attack_stat: float
@export var defense_stat: float
@export var speed: float
@export var moveset: Array = []
@export var has_evolution: bool
