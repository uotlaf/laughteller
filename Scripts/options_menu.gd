extends Control

if()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn");

func _on_portugues_toggled(toggled_on):
	Joke.load_language(0);

func _on_english_toggled(toggled_on):
	Joke.load_language(1);
