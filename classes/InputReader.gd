extends Node
class_name InputReader

@export var input_buffer: InputBuffer

var up: String = "game_up"
var down: String = "game_down"
var left: String = "game_left"
var right: String = "game_right"

var facing_right: bool

# takes a buffer and stores inputs in it

# take absolute inputs and turn into relative directions

func get_direction_numpad() -> int:
	var direction = Vector2(0,0)
	
	if Input.is_action_pressed(left):
		direction.x -= 1
	
	if Input.is_action_pressed(right):
		direction.x += 1

	if Input.is_action_pressed(up):
		direction.y -= 1
	
	if Input.is_action_pressed(down):
		direction.y += 1
	
	if facing_right:
		direction = -direction
	
	match direction:
		Vector2(-1, 1):
			return 1
		Vector2(0, 1):
			return 2
		Vector2(1, 1):
			return 3
		Vector2(-1, 0):
			return 4
		Vector2(0, 0):
			return 5
		Vector2(1, 0):
			return 6
		Vector2(-1, -1):
			return 7
		Vector2(0, -1):
			return 8
		Vector2(1, -1):
			return 9
	
	return 5
