extends Area2D


# Declare member variables here. Examples:
var cars = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_enter(body):
	cars.append(body)
	
func _on_Area2D_body_exit(body):
	cars.erase(body)