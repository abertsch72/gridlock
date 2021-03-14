extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Global")
var level1 = preload("res://Level1.tscn")
var level2 = preload("res://Level2.tscn")
var level3 = preload("res://Level3.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var selected_level
	match globals.level:
		1:
			selected_level = level1.instance()
			globals.max_cars_passed = 10
			globals.max_cars_stopped = 10
		2:
			selected_level = level2.instance()
			globals.max_cars_passed = 10
			globals.max_cars_stopped = 10
		3:
			selected_level = level3.instance()
			globals.max_cars_passed = 50
			globals.max_cars_stopped = 20
	self.add_child(selected_level)
	self.move_child(selected_level, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
