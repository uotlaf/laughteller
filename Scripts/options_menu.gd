extends Control

@onready var button_pt:TextureButton = get_node("Languages/Portugues")
@onready var button_en:TextureButton = get_node("Languages/English")

@onready var button_back:Button = get_node("MarginContainer/VBoxContainer/Back")

func _ready():
	if(Management.current_language==0):
		button_pt.button_pressed=true
	elif(Management.current_language==1):
		button_en.button_pressed=true


func _on_back_mouse_entered():
	SoundFx.ui_button_hover_func()
	
func _on_back_pressed():
	SoundFx.ui_button_press_func()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_portugues_toggled(toggled_on):
	SoundFx.ui_button_press_func()
	Management.load_language(0)
	update_option_texts()
	Management.save_options()

func _on_english_toggled(toggled_on):
	SoundFx.ui_button_press_func()
	Management.load_language(1)
	update_option_texts()
	Management.save_options()

func update_option_texts():
	button_back.text = Management.data.text.back
	
	
func _on_portugues_mouse_entered():
	SoundFx.ui_button_hover_func()

func _on_english_mouse_entered():
	SoundFx.ui_button_hover_func()
