extends Node


var current_joke : int = -1
var current_language : int = 0

var languages : Array = ["pt", "en"]
const data_json_path : String = "res://Assets/Jokes/"
const config_path : String = "./config.txt"

var selected_joke
var selected_chapter

var data: Dictionary 

func load_language(language_no):
	var path : String = data_json_path + "info_" + languages[language_no] + ".json"
	var file = FileAccess.open(path, FileAccess.READ)
	assert(file)
	var json = JSON.new()
	assert(json.parse(file.get_as_text()) == OK)
	file.close()
	data = json.data
	current_language=language_no
	
func load_options():
	var file = FileAccess.open(config_path, FileAccess.READ)
	if file:
		var json = JSON.new()
		if (json.parse(file.get_as_text()) == OK):
			current_language = json.data.current_language
		file.close()
	else:
		print("Cannot load config file")
		save_options()
	
	
func save_options():
	var temp : Dictionary = {'current_language' : current_language}
	var file = FileAccess.open(config_path, FileAccess.WRITE)
	var temp_str : String = JSON.stringify(temp)
	file.store_string(temp_str)
	file.close()
	
	
	

# Carrega as piadas
func _ready():
	load_options()
	load_language(current_language)

# Tela cheia
func _unhandled_input(event):
	if event is InputEventKey and event.get_keycode() == KEY_F11 and event.is_pressed():
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass
