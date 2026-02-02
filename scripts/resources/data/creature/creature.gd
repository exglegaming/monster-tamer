class_name Creature
extends Resource


@export var id: String
@export var index_number: int
@export var image: Texture2D
@export_enum("Fire", "Water", "Grass", "Ground", "Electric") var type: String
@export var level: int
@export var experiece_points: float
@export var name: String
@export var moveset: Array = []