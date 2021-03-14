extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	print("starting game...")
	globals.backed_up_to_start = false
	globals.num_cars_stopped = 0
	globals.num_cars_passed = 0

	globals.has_won = false
	globals.has_lost = false
	get_tree().change_scene("res://PlayScene.tscn")
	
