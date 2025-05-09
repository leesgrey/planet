class_name OrbitingCamera
extends Node3D

@export var player_node: CharacterBody3D
@export var margin: float
@export var debug: CameraDebugControl
@export var camera: Camera3D
@export var planet: MeshInstance3D

var boundary_angle: float

func _ready():
	var dist_from_origin = position.distance_to(camera.global_position)
	var planet_radius = planet.mesh.radius
	boundary_angle = asin(planet_radius / dist_from_origin) 


func update_camera(player_velocity : Vector3):
	print("\n")
	var to_player = (player_node.position - camera.global_position).rotated(Vector3(0, 1, 0), -rotation.y)
	to_player.y = 0
	var player_angle = (PI/2) - atan(abs(to_player.z)/abs(to_player.x))

	if player_angle >= boundary_angle:
		var l2 = player_velocity.length_squared()
		var m2 = player_node.position.length_squared()
		var n2 = (player_node.position - player_velocity).length_squared()
		var x = acos((m2 + n2 - l2) / (2 * sqrt(m2) * sqrt(n2)))
		print("ROTATING " + str(rad_to_deg(x)))
		if to_player.x < 0:
			rotate_y(-x)
		else:
			rotate_y(x)
