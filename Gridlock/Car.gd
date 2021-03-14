extends KinematicBody2D

enum int_direction {EASTWEST, NORTHSOUTH, LEFTEASTWEST, LEFTNORTHSOUTH}
enum car_direction {NORTH, SOUTH, EAST, WEST}
enum car_state {STOPPED, MOVING, TURNING}
const MOVE_SPEED = 300
const MIN_DIST = 300

var currDirection = 0
var currState = car_state.STOPPED
onready var raycast = $RayCast2D


func _ready():
	yield(get_tree(), "idle_frame")
	# TODO: Not sure if i need to call a method on any other objects. Maybe scene to display car?
	get_tree().call_group("", "", self)
	
	
func _physics_process(delta):
	var move_vec = Vector2()
	var coll = raycast.get_collider()
	if raycast.is_colliding():
		if get_dist_to_obj(coll) > MIN_DIST:
			currState = car_state.MOVING
			move_vec.x = get_x_move() * MOVE_SPEED
			move_vec.y = get_y_move() * MOVE_SPEED
		elif coll.has_method("get_current_direction"):
			var ok_to_move = check_intersection(coll.get_current_direction())
			if ok_to_move:
				currState = car_state.MOVING
				move_vec.x = get_x_move() * MOVE_SPEED
				move_vec.y = get_y_move() * MOVE_SPEED
			else:
				currState = car_state.STOPPED
				move_vec.x = 0
				move_vec.y = 0
		elif raycast.is_colliding() and coll.has_method("get_car_state"):
			# we're hitting a car. Might want to change this, just stopping if too close to car
			currState = car_state.STOPPED
			move_vec.x = 0
			move_vec.y = 0
	move_and_collide(move_vec * MOVE_SPEED * delta)

func check_intersection(int_dir):
	if int_dir == int_direction.EASTWEST and (currDirection == car_direction.EAST or currDirection == car_direction.WEST):
		return true
	elif int_dir == int_direction.NORTHSOUTH and (currDirection == car_direction.NORTH or currDirection == car_direction.SOUTH):
		return true
	else:
		return false
		
func get_x_move():
	if currDirection == car_direction.EAST:
		return 1
	elif  currDirection == car_direction.WEST:
		return -1
	else:
		return 0
		
func get_y_move():
	if currDirection == car_direction.NORTH:
		return -1
	elif  currDirection == car_direction.SOUTH:
		return 1
	else:
		return 0

func get_car_state():
	return currState

func get_dist_to_obj(coll):
	var origin = raycast.global_transform.origin
	var collision_point = raycast.get_collision_point()
	return origin.distance_to(collision_point)
