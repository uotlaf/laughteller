extends Marker2D

const PEACE: PackedScene = preload("res://Scenes/test_outrapeace.tscn")

func _ready():
	var peace = PEACE.instantiate()
	peace.original_position = global_position
	get_parent().call_deferred("add_child", peace)
