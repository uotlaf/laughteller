extends CharacterBody2D

class_name Main_Peace

var hold: bool = false

func _physics_process(_delta: float):
	if hold:
		global_position = get_global_mouse_position()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		hold = event.is_pressed()
