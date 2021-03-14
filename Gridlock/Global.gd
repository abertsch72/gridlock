extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var backed_up_to_start = false
var num_cars_stopped = 0
var num_cars_passed = 0
const max_cars_stopped = 10 #lose condition
const max_cars_passed = 10 #win condition

var has_won = false
var has_lost = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_cars_stopped >= max_cars_stopped or backed_up_to_start:
		print("you lost") #TODO: update UI
		has_lost = true
	elif num_cars_passed >= max_cars_passed:
		print("you won") #TODO: update UI
		has_won = true
