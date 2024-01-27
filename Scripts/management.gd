extends Node

var act_joke = 0

var current_language : bool = 0

const jokes_json_path : String = "res://Assets/Jokes/info.json"

var jokes: Dictionary 

func _ready():
	var file = FileAccess.open(jokes_json_path, FileAccess.READ)
	assert(file)
	var json = JSON.new()
	assert(json.parse(file.get_as_text()) == OK)
	jokes = json.data

func _unhandled_input(event):
	if event is InputEventKey and event.get_keycode() == KEY_F11 and event.is_pressed():
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass
