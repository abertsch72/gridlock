extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "_on_Area2D_body_enter")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_enter(body):
	print("entered endpoint ")
	if not globals.has_won and not globals.has_lost:
		globals.num_cars_passed += 1
	body.queue_free()
