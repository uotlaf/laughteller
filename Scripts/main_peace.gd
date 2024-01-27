extends CharacterBody2D

class_name Main_Peace

var mouse_on: bool = false

func _physics_process(_delta: float):
	if Input.is_action_pressed("ui_left_mouse"):
		if mouse_on:
			global_position = get_global_mouse_position()


func mouse_ent():
	mouse_on = true

func mouse_ext():
	mouse_on = false
