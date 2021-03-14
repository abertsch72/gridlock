extends StaticBody2D

export(NodePath) var north_road
export(NodePath) var south_road
export(NodePath) var east_road
export(NodePath) var west_road

enum direction {EASTWEST, NORTHSOUTH, EASTWEST_LEFT, NORTHSOUTH_LEFT}
var current_direction = direction.EASTWEST

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func get_current_direction():
	return current_direction
