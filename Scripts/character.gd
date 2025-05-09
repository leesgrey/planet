extends CharacterBody3D

@export var speed: float
@export var camera: Camera3D
@export var debug: Node3D

var target_velocity = Vector3.ZERO


func _physics_process(_delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		var to_origin: Vector3 = position - to_local(Vector3(0, 0, 0))
		direction += Vector3.UP.cross(to_origin.normalized())

	if Input.is_action_pressed("move_left"):
		var from_origin: Vector3 = to_local(Vector3(0, 0, 0)) - position
		direction += Vector3.UP.cross(from_origin.normalized())

	if Input.is_action_pressed("move_up"):
		var screen_position = camera.unproject_position(position)
		print("screen position: " + str(screen_position))
		var from_center = screen_position.x - (DisplayServer.window_get_size().x / 2.)
		print("from center: " + str(from_center))
		var camera_direction = camera.get_global_transform().basis.z
		camera_direction.y = 0
		print("camera direction: " + str(camera_direction))
		direction += camera_direction.rotated(Vector3(0, 1, 0), from_center * 0.1)

	if Input.is_action_pressed("move_down"):
		var screen_position = camera.unproject_position(position)
		print("screen position: " + str(screen_position))
		var from_center = screen_position.x - (DisplayServer.window_get_size().x / 2.)
		print("from center: " + str(from_center))
		var camera_direction = camera.get_global_transform().basis.z
		camera_direction.y = 0
		print("camera direction: " + str(camera_direction))
		direction += -camera_direction.rotated(Vector3(0, 1, 0), from_center * 0.1)

	velocity = direction * speed
	move_and_slide()

	debug.update_all(direction * 3)
