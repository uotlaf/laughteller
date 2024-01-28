extends CharacterBody2D

class_name Box

@export var number_box : int = 1
var object_list: Array[CharacterBody2D] = [] # Bloco que está sendo segurado
var type_list: Array[String] = []
var array_combination: Array[String] = ["","",""]
var combination: String = "" 

@onready var joke : Dictionary = Management.data.chapters[Management.selected_chapter].jokes[Management.selected_joke] 

@onready var frases : Array = [get_node("frase1"), get_node("frase2"), get_node("frase3")]

func _physics_process(_delta: float):
	find_combination()
"""	if combination != "":
		var image = Image.new()
		image.load(Joke.jokes[str(Joke.act_joke)][combination])
		var t = ImageTexture.new()
		t = ImageTexture.create_from_image(image)
		$Sprite/BACK_GROUND.texture = t
		$Sprite/BACK_GROUND.visible = true
	else:
		$Sprite/BACK_GROUND.visible = false
"""		

func find_combination():
	var object_ordered : Dictionary = {"0" : null, "1" : null, "2" : null}
	var current_path : Dictionary = joke.blocks[str(number_box)]
	var final_combination : Dictionary = joke.combination[str(number_box)]
	
	for i in object_list:
		match i.t_type:
			"Scenario":
				object_ordered["0"] = i
			"Character":
				object_ordered["1"] = i
			"Dialog":
				object_ordered["2"] = i
	if (object_ordered["0"]):
		current_path = current_path.child["0"]
	if (object_ordered["1"]):
		current_path = current_path.child["1"]
	if (object_ordered["2"]):
		current_path = current_path.child["2"]
	
	var image = Image.new()
	image.load(current_path.image)
	var t = ImageTexture.new()
	t = ImageTexture.create_from_image(image)
	$Sprite/BACK_GROUND.texture = t
	$Sprite/BACK_GROUND.visible = true
	
	if (object_ordered["0"] and object_ordered["1"] and object_ordered["2"] and number_box != 0):
		frases[number_box].visible = true	
	elif (number_box == 0 and object_ordered["0"] and object_ordered["1"] and not object_ordered["2"]):
		frases[number_box].visible = true
	else:
		if (frases[number_box]):
			frases[number_box].visible = false
	
	"""
	var c_type: String = ""
	for i in object_list:
		match i.t_type:
			"Scenario":
				c_type = "sc"
			"Character":
				c_type = "c"
			"Dialog":
				c_type = "d"
				
		array_combination.append(c_type+str(i.number_peace))
	combination = array_combination[0]+array_combination[1]+array_combination[2]
"""

func _on_area_2d_body_entered(body):
	
	if body is Main_Peace:	
		if not type_list.has(body.t_type):
			#FAZER ISSO SE O TIPO NÃO EXISTIR DENTRO DA BOX
			if body.box_turn: #and not has_grabbed:
				#SE AS CONDIÇÕES SÃO OBEDECIDAS ENTÃO É GRABADO
				#has_grabbed = true
				body.grab(self)
				body.in_box = true
				object_list.append(body)
				type_list.append(body.t_type)
	#print(str(number_box) + type_list)
func _on_area_2d_body_exited(body):
	# Corpo está sendo segurado pelo cursor e é o que está sendo segurado pela caixa
	#FUNCIONA PARA UM OBJETO DENTRO DA BOX, MAS PARA MAIS DELES, FUNCIONA?
	#vejamos: Não, pois só guardamos o primeiro objeto que entrou na Box em object.
	#Podemos criar uma Lista para armazenar os objetos q estao dentro da box.
	#AGORA, EM VEZ DE VERIFICAR SÓ UM OBEJTOS VERIFCAMOS SE QUAL OBJETO ESTA SAINDO DA BOX PARA RETIRARMOS SEU TIPO do TYPELIST
	if body is Main_Peace and body.hold and object_list.has(body):
		#has_grabbed = false
		body.ungrab()
		body.in_box = false
		type_list.remove_at(type_list.find(body.t_type))
		object_list.remove_at((object_list.find(body)))
		


