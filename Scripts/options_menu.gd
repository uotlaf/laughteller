extends Control

@onready var button_pt:TextureButton = get_node("Languages/Portugues")
@onready var button_en:TextureButton = get_node("Languages/English")

@onready var button_back:Button = get_node("MarginContainer/VBoxContainer/Back")

func _ready():
	if(Management.current_language==0):
		button_pt.button_pressed=true
	elif(Management.current_language==1):
		button_en.button_pressed=true

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_portugues_toggled(toggled_on):
	Management.load_language(0)
	update_option_texts()

func _on_english_toggled(toggled_on):
	Management.load_language(1)
	update_option_texts()

func update_option_texts():
	button_back.text = Management.data.text.back
	
