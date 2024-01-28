extends Control

#var new_game_button:Button = find_node("NewGame");
#@export var options_button:Button = null #get_tree().get_root().GetNode("Options");
#@export var quit_button:Button = null #get_tree().get_root().GetNode("Quit");

func _ready():
	if(Joke.current_language==0):
		#new_game_button.text = "Jogar"
		#options_button.text = "Opções"
		#quit_button.text = "Sair"
		pass;
		
	elif(Joke.current_language==1):
		#new_game_button.text = "New game"
		#options_button.text = "Options"
		#quit_button.text = "Quit"
		pass;

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/test.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn");

func _on_quit_pressed():
	get_tree().quit();
	
