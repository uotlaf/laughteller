extends CharacterBody2D

class_name Main_Peace

@export_category("Configs")
@export_enum("Scenario", "Character","Dialog") var type: String
@export var number_peace: int = 1
@export_group("Inputs Test")
@export var in_box = false # Está dentro de uma caixa
@export var hold: bool = false # Está sendo segurado pelo cursor

var original_position: Vector2 
var Box_realtive: Box
var tween_finish = false
var box_turn: bool = true

func _ready():
	Joke.act_joke = 1
	original_position = global_position
	
	match type:
		"Scenario":
			$Initial/Background.texture = preload("res://Assets/Pieces/scenary_piece.png")
		#"Character":
			#$Initial/Background.texture = preload("res://Assets/Pieces/character_piece.png")
		#"Dialog":
			#$Initial/Background.texture = preload("res://Assets/Pieces/dialog_piece.png") 
		
	$BoxImage.scale = Vector2(2.75, 2.75)
	
	update_textures($Initial/Sprite2D, "p", number_peace)
	
func _physics_process(_delta: float):
	#print("physics: ", hold)
	if not in_box and global_position == original_position:
		box_turn = true
	if hold:
		global_position = get_global_mouse_position()
		$BoxImage.visible = false
		$Initial.visible = true
	else:
		if in_box and not hold:
			box_turn = true
		else:
			if not in_box and not hold:
				box_turn = false
		if not in_box:
			$BoxImage.visible = false
			$Initial.visible = true
			var my_tween = get_tree().create_tween()
			my_tween.finished.connect(finished_home_tween)
			my_tween.tween_property(self, "position", original_position, 0.25).set_trans(Tween.TRANS_LINEAR)
			#global_position = original_position
					
		else:
			#global_position = Box_realtive.global_position
			var my_tween = get_tree().create_tween()
			tween_finish = false
			my_tween.finished.connect(finished_tween)
			my_tween.tween_property(self, "position", Box_realtive.global_position, 0.25).set_trans(Tween.TRANS_LINEAR)
			$BoxImage.visible = true
			$Initial.visible = false
			

func grab(box: Box):
	Box_realtive = box
	update_textures($BoxImage, "b", Box_realtive.number_box)
	global_position = box.global_position
	in_box = true

func ungrab():
	in_box = false
	
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		print(event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not hold and event.is_pressed():
			await get_tree().create_timer(1).timeout
		print("Antiga entrada:", hold, " is pressed: ", event.is_pressed())
		hold = event.is_pressed()
		print("Novo valor:", hold)

func update_textures(sprite: Sprite2D, type: String, number_index: int):
	var image = Image.new()
	if type == "p":
		image.load(Joke.jokes[str(Joke.act_joke)][type+str(number_peace)][type])
	if type == "b":
		image.load(Joke.jokes[str(Joke.act_joke)]["p"+str(number_peace)][type+str(number_index)])
		print(Joke.jokes[str(Joke.act_joke)]["p"+str(number_peace)][type+str(number_index)])
	var t = ImageTexture.new()
	t = ImageTexture.create_from_image(image)
	sprite.texture = t

func finished_tween():
	tween_finish = true
	
func finished_home_tween():
	box_turn = true

	
