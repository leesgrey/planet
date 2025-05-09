extends Node3D

@export var player_node: CharacterBody3D
@export var margin: float
@export var debug: CameraDebugControl
@export var camera: Camera3D
@export var planet: MeshInstance3D


func _ready():
	debug.set_margin(margin)


func _physics_process(_delta):
	var dist_from_origin = position.distance_to(Vector3(0, 0, 0))
	var planet_radius = planet.mesh.radius
	var angle = asin(planet_radius / dist_from_origin) * 2
	print(angle)
