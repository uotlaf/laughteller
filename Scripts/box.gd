extends CharacterBody2D

class_name Box

@export var number_box:int = 1

func _on_area_2d_body_entered(body):
	if body is Main_Peace:
		body.grab(self)


func _on_area_2d_body_exited(body):
	if body is Main_Peace:
		body.ungrab()
