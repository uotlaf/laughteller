extends CharacterBody2D

class_name Main_Peace

var in_box = false
var original_position: Vector2 
var hold: bool = false
var Box_realtive: Box



func _ready():
	Joke.act_joke = 1
	update_textures($BoxImage)
	update_textures($Sprite2D)
	$BoxImage.scale = Vector2(2.75, 2.75)
	
func _physics_process(_delta: float):
	if not in_box:
		global_position = original_position
		$BoxImage.visible = false
		
		
	else:
		global_position = Box_realtive.global_position
		if not hold:
			$BoxImage.visible = true
			$Sprite2D.modulate = Color("101010")
		else:
			$Sprite2D.modulate = Color("FFFFFF")
			$BoxImage.visible = false
	if hold:
		global_position = get_global_mouse_position()
		
			
func grab(box: Box):
	Box_realtive = box
	global_position = box.global_position
	in_box = true

func ungrab():
	in_box = false
	
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		hold = event.is_pressed()

func update_textures(sprite: Sprite2D):
	Joke.act_p += 1
	var image = Image.new()
	image.load(Joke.jokes[str(Joke.act_joke)]["path_p"+str(Joke.act_p)])
	var t = ImageTexture.new()
	t = ImageTexture.create_from_image(image)
	sprite.texture = t
	
