extends Node

var act_joke = 0

const jokes_json_path : String = "res://Assets/Jokes/info.json"

var jokes: Dictionary 

func _ready():
	var file = FileAccess.open(jokes_json_path, FileAccess.READ)
	assert(file)
	var json = JSON.new()
	assert(json.parse(file.get_as_text()) == OK)
	jokes = json.data
