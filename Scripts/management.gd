extends Node

var act_joke = 0

var current_language : int = 0

var languages : Array = ["pt", "en"]
const data_json_path : String = "res://Assets/Jokes/"

var data: Dictionary 

func load_language(language_no):
	var path : String = data_json_path + "info_" + languages[language_no] + ".json"
	var file = FileAccess.open(path, FileAccess.READ)
	assert(file)
	var json = JSON.new()
	assert(json.parse(file.get_as_text()) == OK)
	data = json.data
	current_language=language_no
	

# Carrega as piadas
func _ready():
	load_language(0)

# Tela cheia
func _unhandled_input(event):
	if event is InputEventKey and event.get_keycode() == KEY_F11 and event.is_pressed():
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass
