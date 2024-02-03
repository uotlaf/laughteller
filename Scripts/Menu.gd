extends Control

@onready var play_button:Button = get_node("MarginContainer/VBoxContainer/Play")
@onready var options_button:Button = get_node("MarginContainer/VBoxContainer/Options")
@onready var quit_button:Button = get_node("MarginContainer/VBoxContainer/Quit")

func _ready():
	var text_data = Management.data.text
	play_button.text = text_data.play
	options_button.text = text_data.options
	quit_button.text = text_data.quit


func _on_play_mouse_entered():
	SoundFx.ui_button_hover_func()
	
func _on_play_pressed():
	SoundFx.ui_button_press_func()
	get_tree().change_scene_to_file("res://Scenes/peace_select.tscn")


func _on_options_mouse_entered():
	SoundFx.ui_button_hover_func()
	
func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_quit_pressed():
	SoundFx.ui_button_press_func()
	get_tree().quit()

func _on_quit_mouse_entered():
	SoundFx.ui_button_hover_func()
