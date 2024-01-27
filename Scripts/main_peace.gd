extends CharacterBody2D

class_name Main_Peace

@export var number_peace: int = 1

var in_box = false
var original_position: Vector2 
var hold: bool = false
var Box_realtive: Box



func _ready():
	Joke.act_joke = 1
	original_position = global_position
	$BoxImage.scale = Vector2(2.75, 2.75)
	update_textures($Sprite2D, "p", number_peace)
	
	
func _physics_process(_delta: float):
	if not in_box:
		global_position = original_position
		$BoxImage.visible = false
		$Sprite2D.visible = true
	else:
		global_position = Box_realtive.global_position
		if not hold:
			$Sprite2D.visible = false
			$BoxImage.visible = true
		else:
			$Sprite2D.visible = true
			$BoxImage.visible = false
	if hold:
		global_position = get_global_mouse_position()
	
		
			
func grab(box: Box):
	Box_realtive = box
	update_textures($BoxImage, "b", Box_realtive.number_box)
	global_position = box.global_position
	in_box = true

func ungrab():
	in_box = false
	
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		hold = event.is_pressed()

func update_textures(sprite: Sprite2D, type: String, number_index: int):
	var image = Image.new()
	print(type+str(number_index))
	if type == "p":
		image.load(Joke.jokes[str(Joke.act_joke)][type+str(number_peace)]["path_"+type])
	if type == "b":
		image.load(Joke.jokes[str(Joke.act_joke)]["p"+str(number_peace)]["path_"+type+str(number_index)])

	var t = ImageTexture.new()
	t = ImageTexture.create_from_image(image)
	sprite.texture = t
	
