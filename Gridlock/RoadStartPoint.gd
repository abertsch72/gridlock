extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum car_direction {NORTH, SOUTH, EAST, WEST}
var rng = RandomNumberGenerator.new()
var elapsed_time = 0
var SPAWN_TIMEOUT = 1
var car = preload("res://Car.tscn")
export var direction = car_direction.EAST
export var probability_factor = 2

onready var globals = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	self.connect("body_entered", self, "_on_Area2D_body_enter")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.has_won or globals.has_lost:
		return
	elapsed_time += delta
	if elapsed_time >= SPAWN_TIMEOUT:
		elapsed_time = 0
		if rng.randi_range(0,probability_factor) == 0:
			var new_car = car.instance()
			new_car.scale.y = 10
			new_car.scale.x = 5
			new_car.rotate(PI/2)
			self.add_child(new_car)
			print("car spawned")
			
func _on_Area2D_body_enter(body):
	if globals.has_won or globals.has_lost:
		return
	if not body.ok_to_move:
		globals.has_lost = true
		print("backed up ")
