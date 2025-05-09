class_name CameraDebugControl
extends Control

var margin


func _draw():
	var screen_size: Vector2 = DisplayServer.window_get_size()
	draw_line(Vector2(margin, 0), Vector2(margin, screen_size.y), Color.PEACH_PUFF, 1.)
	draw_line(
		Vector2(screen_size.x - margin, 0),
		Vector2(screen_size.x - margin, screen_size.y),
		Color.PEACH_PUFF,
		1.
	)


func set_margin(new_margin):
	margin = new_margin
	queue_redraw()
