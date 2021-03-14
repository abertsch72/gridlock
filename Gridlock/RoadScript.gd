extends Area2D



# Declare member variables here. Examples:
var cars = []

export(NodePath) var connection_1
export(NodePath) var connection_2

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "_on_Area2D_body_enter")
	self.connect("body_exited", self, "_on_Area2D_body_exit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_enter(body):
	cars.append(body)
	print("entered road ")
	
func _on_Area2D_body_exit(body):
	cars.erase("exited road ")
