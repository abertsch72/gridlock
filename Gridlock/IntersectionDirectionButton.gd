extends Button

export(NodePath) var north_road
export(NodePath) var south_road
export(NodePath) var east_road
export(NodePath) var west_road

var parent

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	self.parent = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _button_pressed():
	parent.current_direction = parent.direction.EASTWEST
