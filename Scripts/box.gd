extends CharacterBody2D

class_name Box
var has_grabbed: bool = false

@export var number_box : int = 1
#ar object : CharacterBody2D # Bloco que está sendo segurado

func _on_area_2d_body_entered(body):
	if body is Main_Peace:
		if body.box_turn and not has_grabbed:
			body.grab(self)
			has_grabbed = true

	# Corpo está sendo segurado pelo cursor e não tem um expandido
	#if body is Main_Peace and body.hold and not object and not has_grabbed:
		#object = body
		#has_grabbed = true
		#object.grab(self)

func _on_area_2d_body_exited(body):
	# Corpo está sendo segurado pelo cursor e é o que está sendo segurado pela caixa
	if body is Main_Peace: #and body.hold and body == object:
		has_grabbed = false
		body.ungrab()
		#object.ungrab()
		#object = null
