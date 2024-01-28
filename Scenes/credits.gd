extends Control

@onready var thank_you_button:Label = get_node("ThankYou")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _ready():
	thank_you_button.text = Management.data.text.thank_you
