extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	print("going back to main menu...")
	get_tree().change_scene("res://MainMenu.tscn")
