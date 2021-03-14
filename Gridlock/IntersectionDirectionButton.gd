extends TextureButton

export(NodePath) var north_road
export(NodePath) var south_road
export(NodePath) var east_road
export(NodePath) var west_road

var parent

export(Texture) var EASTWEST_ICON
export(Texture) var NORTHSOUTH_ICON
export(Texture) var EASTWEST_PRESSED_ICON
export(Texture) var NORTHSOUTH_PRESSED_ICON

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	self.parent = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _button_pressed():
	if parent.current_direction == parent.direction.EASTWEST:
		parent.current_direction = parent.direction.NORTHSOUTH
		parent.rotate(PI/2)
	elif parent.current_direction == parent.direction.NORTHSOUTH:
		parent.current_direction = parent.direction.EASTWEST
		self.texture_normal = EASTWEST_ICON
		self.texture_pressed = EASTWEST_PRESSED_ICON
		parent.rotate(PI/2)
