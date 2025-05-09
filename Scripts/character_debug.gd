extends Node3D

var radius_line
var radius_material

var target_line
var target_material

var origin_mesh


func _ready():
	origin_mesh = MeshInstance3D.new()
	var sphere = SphereMesh.new()
	var sphere_material = ORMMaterial3D.new()

	origin_mesh.mesh = sphere
	origin_mesh.position = to_local(Vector3(0, 0, 0))
	origin_mesh.cast_shadow = false

	sphere.radius = 1
	sphere.height = sphere.radius * 2
	sphere.material = sphere_material

	sphere_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	sphere_material.albedo_color = Color.YELLOW

	add_child(origin_mesh)

	var radius_mesh = MeshInstance3D.new()
	radius_line = ImmediateMesh.new()
	radius_material = ORMMaterial3D.new()

	radius_mesh.mesh = radius_line
	radius_mesh.cast_shadow = false

	radius_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	radius_material.albedo_color = Color.LIME_GREEN

	update_radius()
	add_child(radius_mesh)

	var target_mesh = MeshInstance3D.new()
	target_line = ImmediateMesh.new()
	target_material = ORMMaterial3D.new()

	target_mesh.mesh = target_line
	target_mesh.cast_shadow = false

	target_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	target_material.albedo_color = Color.MEDIUM_ORCHID

	add_child(target_mesh)


func update_all(target):
	update_radius()
	update_origin()
	if target != Vector3.ZERO:
		update_target(target)


func update_origin():
	origin_mesh.position = to_local(Vector3(0, 0, 0))


func update_radius():
	radius_line.clear_surfaces()

	radius_line.surface_begin(Mesh.PRIMITIVE_LINES, radius_material)
	radius_line.surface_add_vertex(to_local(Vector3(0, 0, 0)))
	radius_line.surface_add_vertex(Vector3(0, 0, 0))

	radius_line.surface_end()


func update_target(target):
	target_line.clear_surfaces()

	target_line.surface_begin(Mesh.PRIMITIVE_LINES, target_material)
	target_line.surface_add_vertex(Vector3(0, 0, 0))
	target_line.surface_add_vertex(target)
	target_line.surface_end()
