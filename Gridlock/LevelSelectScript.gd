extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("item_selected", self, "_item_selected")
	
func _item_selected(level_num):
	globals.level = level_num + 1
