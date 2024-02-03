extends Button

func _on_pressed():
	SoundFx.ui_button_press_func()
	get_tree().change_scene_to_file("res://Scenes/peace_select.tscn")


func _on_mouse_entered():
	SoundFx.ui_button_hover_func()
