extends Node3D

@export var player_node: CharacterBody3D
@export var margin: float
@export var debug: CameraDebugControl
@export var camera: Camera3D


func _ready():
	debug.set_margin(margin)


func _physics_process(_delta):
	var screen_size: Vector2 = DisplayServer.window_get_size()
	var player_on_screen = camera.unproject_position(player_node.position)
	if player_on_screen.x < margin:
		rotate_y(-0.01)  # @todo calculate from player velocity
	elif player_on_screen.x > screen_size.x - margin:
		rotate_y(0.01)  # @todo calculate from player velocity
