extends Button

enum direction {EASTWEST, NORTHSOUTH, EASTWEST_LEFT, NORTHSOUTH_LEFT}
var current_direction = direction.EASTWEST

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")

func get_current_direction():
	return current_direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
