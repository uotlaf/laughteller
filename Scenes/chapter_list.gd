extends VBoxContainer

var selectedChapter : int = 0
var current_joke : int = 0
@export var button_script : Script

@onready var chapter_name = get_node("../../chapter_name")

# Called when the node enters the scene tree for the first time.
func _ready():
	change_chapter(0)

func change_chapter(chap_no):
	if chap_no < Management.data.chapters.size():
		chapter_name.text = "[center]" + Management.data.chapters[str(chap_no)].name
		for joke in Management.data.chapters[str(chap_no)].jokes:
			var temp = Management.data.chapters[str(chap_no)].jokes[joke]
			var button = Button.new()
			var style = StyleBoxFlat.new()
			style.bg_color = Color("#d9865d")
			add_child(button)
			button.alignment = 0
			button.add_theme_stylebox_override("hover", style)
			button.add_theme_stylebox_override("normal", style)
			button.text = temp.name
			button.set_script(button_script)
			button.button_id = joke
			button.chapter_id = selectedChapter
			button.connect("pressed", button.on_pressed)
			button.set_process(true)
			

