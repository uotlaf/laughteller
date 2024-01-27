extends CharacterBody2D

class_name Box

@export var number_box : int = 1
var object : CharacterBody2D # Bloco que está sendo segurado

func _on_area_2d_body_entered(body):
	if body is Main_Peace:
		if body.box_turn:
			body.grab(self)

	# Corpo está sendo segurado pelo cursor e não tem um expandido
	if body is Main_Peace and body.hold and not object:
		object = body
		object.grab(self)

func _on_area_2d_body_exited(body):
	# Corpo está sendo segurado pelo cursor e é o que está sendo segurado pela caixa
	if body is Main_Peace and body.hold and body == object:
		object.ungrab()
		object = null
