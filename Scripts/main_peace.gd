extends CharacterBody2D

class_name Main_Peace

var in_box = false
var mouse_on: bool = false
var original_position: Vector2


	
func _physics_process(_delta: float):
	if not in_box:
		global_position = original_position
	if Input.is_action_pressed("ui_left_mouse"):
		if mouse_on:
			global_position = get_global_mouse_position()
		
			
func grab(box: Box):
	in_box = true
	global_position = box.global_position

func ungrab():
	in_box = false
	
func mouse_ent():
	mouse_on = true

func mouse_ext():
	mouse_on = false
