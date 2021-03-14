extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var activated = false
onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	print("quitting...")
	get_tree().change_scene("res://MainMenu.tscn")
	
func _process(delta):
	if activated:
		return
	if globals.has_won:
		self.set_visible(true)
		self.set_text("You Won! Click Here To Return To Main Menu")
		activated = true
	elif globals.has_lost:
		self.set_visible(true)
		self.set_text("You Lost! Click Here To Return To Main Menu")
		activated = true
