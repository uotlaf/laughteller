extends Node

var button_id
var chapter_id

func on_pressed():
	SoundFx.ui_button_press_func()
	Management.selected_chapter = str(chapter_id)
	Management.selected_joke = str(button_id)
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
