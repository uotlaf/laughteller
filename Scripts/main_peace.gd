extends CharacterBody2D

class_name Main_Peace

@export_category("Configs")
@export_enum("Scenario", "Character","Dialog") var t_type: String
@export var number_peace: int = 1
@export_group("Inputs Test")
var in_box: bool = false # Está dentro de uma caixa
var hold: bool = false # Está sendo segurado pelo cursor

var cursor_images : Array = ["res://Assets/UI/cursor.png", 
							 "res://Assets/UI/cursor_holding.png"]

var original_position: Vector2 
var Box_realtive: Box
var box_turn: bool = true

func _ready():
	Joke.act_joke = 1
	original_position = global_position
	
	match t_type:
		"Scenario":
			$Initial/Background.texture = preload("res://Assets/Pieces/scenary_piece.png")
			update_textures($Initial/Sprite2D, "sc")
		"Character":
			$Initial/Background.texture = preload("res://Assets/Jokes/j1/pieces/mickey_piece.png")
			update_textures($Initial/Sprite2D, "c")
		"Dialog":
			$Initial/Background.texture = preload("res://Assets/Pieces/dialog_piece.png") 
			update_textures($Initial/Sprite2D, "d")
		
	
	
func _physics_process(_delta: float):
	if hold:
		global_position = get_global_mouse_position()
		$Initial.visible = true
	else:
		if in_box and not hold:
			box_turn = true
		else:
			if not in_box and not hold:
				box_turn = false
		if not in_box:
			$Initial.visible = true
			var my_tween = get_tree().create_tween()
			my_tween.finished.connect(finished_home_tween)
			my_tween.tween_property(self, "position", original_position, 0.25).set_trans(Tween.TRANS_LINEAR)
			#global_position = original_position
					
		else:
			#global_position = Box_realtive.global_position
			var my_tween = get_tree().create_tween()
			my_tween.tween_property(self, "position", Box_realtive.global_position, 0.25).set_trans(Tween.TRANS_LINEAR)
			$Initial.visible = false
			

func grab(box: Box):
	Box_realtive = box
	global_position = box.global_position
	in_box = true

func ungrab():
	in_box = false
	
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		hold = !hold
		Input.set_custom_mouse_cursor(load(cursor_images[int(hold)]))

func update_textures(sprite: Sprite2D, type: String):
	var image = Image.new()
	image.load(Joke.jokes[str(Joke.act_joke)][type+str(number_peace)])
	var t = ImageTexture.new()
	t = ImageTexture.create_from_image(image)
	sprite.texture = t

	
func finished_home_tween():
	box_turn = true

	
