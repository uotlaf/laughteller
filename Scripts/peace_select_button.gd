extends Node

var button_id
var chapter_id

func on_pressed():
	Management.selected_chapter = chapter_id
	Management.selected_joke = button_id
	get_tree().change_scene_to_file("res://Scenes/main_peace.tscn")
