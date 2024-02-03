extends Node

@onready var ui_button_press = get_node("ui_button_press")
@onready var ui_button_hover = get_node("ui_button_hover")

func ui_button_press_func():
	if(ui_button_hover.playing):
		ui_button_hover.stop()
	ui_button_press.play()

func ui_button_hover_func():
	if(ui_button_press.playing):
		ui_button_press.stop()
	ui_button_hover.play()
