extends Node2D

var pieces : Array

@onready var joke : Dictionary = Management.data.chapters[Management.selected_chapter].jokes[Management.selected_joke] 
@onready var background:TextureRect = get_node("background")

var margin_horizontal : int = 100
var default_y : int = 500


# (bg.width - (margem * 2)) / quant_pieces - 1
@onready var offset : float = (background.get_size().x - (margin_horizontal  * 2)) / (joke.n_pieces - 1)
# Called when the node enters the scene tree for the first time.
func _ready():
	for piece in range(joke.n_pieces):
		var button = Button.new()
		add_child(button)
		button.position.x = (offset * piece) + margin_horizontal
		button.position.y = default_y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
