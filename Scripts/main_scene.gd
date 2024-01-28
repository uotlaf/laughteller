extends Node2D

#Management.selected_chapter = "0"
#Management.selected_joke = "0"

@onready var joke : Dictionary = Management.data.chapters[Management.selected_chapter].jokes[Management.selected_joke] 

var start_coord: Vector2 = Vector2(25, 685)
var size_space: Vector2 = Vector2(1150, 670)
var size_peace: Vector2 = Vector2(120, 150)
var peace_positions: Array[Vector2] = []
var number_positions:int = 0
var n_lines: int = 0
var n_coluns: int = 0

func _ready():
	
	#COLOCAR AS DUAS FUNÇÕES AQUI
	#PRIMEIRO A DIA DECIDIR AS POSIÇÕES DAS PEÇAS
	#SEGUNDO A FUNÇÃO QUE CRIAS AS PEÇAS DE ACORDO COM JSON E NAS POSIÇÕES CORRETAS
	#TESTE NICE	
	decide_positions()
	print(peace_positions)
	instance_peace()


func decide_positions():
	#DIVISÃO E RESTO DE DIVISÃO
	var max_coluns: int = int(size_space.x/size_peace.x)
	
	var start_peace: Vector2 = Vector2(start_coord.x+size_peace.x/2, start_coord.y -size_peace.y/2)
	for i in range(joke.n_pieces):
		#APARENTEMENTE / É RESTO DA DIVISAO E % É DIVIDIDO
		var act_position: Vector2 = Vector2(start_peace.x+(i%max_coluns)*size_peace.x, start_peace.y-size_peace.y*(i/max_coluns))
		peace_positions.append(act_position)

func instance_peace():
	var jk: int= 0
	for i in range(joke.n_types):
		for j in joke.pieces[str(i)].multiplier:
			const PEACE: PackedScene = preload("res://Scenes/main_peace.tscn")
			var peace = PEACE.instantiate()
			peace.global_position = peace_positions[jk]
			match str(joke.pieces[str(i)].type):
				"0":
					peace.t_type = "Scenario"
				"1":
					peace.t_type = "Character"
				"2":
					peace.t_type = "Dialog"
			peace.update_texture(joke.pieces[str(i)].icon)
			call_deferred("add_child", peace)
			jk += 1

