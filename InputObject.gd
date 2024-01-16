class_name InputObject
extends Node

var dir: Vector2 = Vector2(0, 0)
var held_frame_count: int = 1

func equals(inpt: InputObject) -> bool:
	if self.dir != inpt.dir:
		return false
	
	return true

func get_dir() -> Vector2:
	return dir
	
func get_dir_numpad() -> String:
	return vec_to_numpad_string(dir);
	
func get_held_frames() -> int:
	return held_frame_count

func get_held_frames_string() -> String:
	return str(held_frame_count)

static func vec_to_numpad(dir: Vector2) -> int:
	# takes a Vector2 and returns an input in numberpad notation (int)
	
	var numpad_input: int = 5
	
	match dir:
		Vector2(-1,-1):
			numpad_input = 1
		Vector2(0,-1):
			numpad_input = 2
		Vector2(1,-1):
			numpad_input = 3
		Vector2(-1,0):
			numpad_input = 4
		Vector2(0,0):
			numpad_input = 5
		Vector2(1,0):
			numpad_input = 6
		Vector2(-1,1):
			numpad_input = 7
		Vector2(0,1):
			numpad_input = 8
		Vector2(1,1):
			numpad_input = 9
	
	return numpad_input

static func vec_to_numpad_string(dir: Vector2) -> String:
	return(str(vec_to_numpad(dir)))
	
static func numpad_string_to_vec(numpad_input_string: String) -> Vector2:
	return numpad_to_vec(int(numpad_input_string))

static func numpad_to_vec(numpad_input: int) -> Vector2:
	var dir: Vector2 = Vector2(0,0)
	
	match numpad_input:
		1:
			dir = Vector2(-1, -1)
		2:
			dir = Vector2(0, -1)
		3:
			dir = Vector2(1, -1)
		4:
			dir = Vector2(-1, 0)
		5:
			dir = Vector2(0, 0)
		6:
			dir = Vector2(1, 0)
		7:
			dir = Vector2(-1, 1)
		8:
			dir = Vector2(0, 1)
		9:
			dir = Vector2(1, 1)
		
	return dir

func get_dir_string() -> String:
	var dir_string = ""
	
	match dir:
		# numberpad notation
		Vector2(-1,-1):
			dir_string = "DOWN + LEFT (1)"
		Vector2(0,-1):
			dir_string = "DOWN (2)"
		Vector2(1,-1):
			dir_string = "DOWN + RIGHT (3) "
		Vector2(-1,0):
			dir_string = "LEFT (4)"
		Vector2(0,0):
			dir_string = "NEUTRAL (5)"
		Vector2(1,0):
			dir_string = "RIGHT (6)"
		Vector2(-1,1):
			dir_string = "UP + LEFT (7)"
		Vector2(0,1):
			dir_string = "UP (8)"
		Vector2(1,1):
			dir_string = "UP + RIGHT (9)"
	return dir_string
	
func everything_to_string() -> String:
	var dir_string = get_dir_string()
	var frames_string = get_held_frames_string() 
	
	var string = dir_string + ", held for " + frames_string + " frames"
	
	# print(frames_string)
	return string
