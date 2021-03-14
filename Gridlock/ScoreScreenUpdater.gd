extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Global")
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	count += delta
	if(count >= 0.1):
		count = 0
		var new_string = "Cars Passed: %s/%s\nCars Stopped: %s/%s" % \
		[globals.num_cars_passed,\
		globals.max_cars_passed,\
		globals.num_cars_stopped,\
		globals.max_cars_stopped]
		self.set_text(new_string)
