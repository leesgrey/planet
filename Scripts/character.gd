extends CharacterBody3D

@export var speed: float
@export var camera: Camera3D
@export var debug: Node3D

var target_velocity = Vector3.ZERO


func _physics_process(_delta):
	var direction = Vector3.ZERO

	#  @todo: change to input axis, combine
	if Input.is_action_pressed("move_right"):
		var to_origin: Vector3 = position - to_local(Vector3(0, 0, 0))
		direction += Vector3.UP.cross(to_origin.normalized())

	if Input.is_action_pressed("move_left"):
		var from_origin: Vector3 = to_local(Vector3(0, 0, 0)) - position
		direction += Vector3.UP.cross(from_origin.normalized())

	if Input.is_action_pressed("move_up"):
		var to_camera = position - camera.position
		to_camera.y = 0
		direction += to_camera.normalized()

	if Input.is_action_pressed("move_down"):
		var from_camera = camera.position - position
		from_camera.y = 0
		direction += from_camera.normalized()

	velocity = direction * speed
	move_and_slide()

	debug.update_all(direction * 3)
