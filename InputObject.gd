class_name InputObject
extends Node

var dir: Vector2 = Vector2(0, 0)
var held_frame_count: int = 1

func frames_to_string() -> String:
	return str(held_frame_count)

func equals(inpt: InputObject) -> bool:
	if self.dir != inpt.dir:
		return false
	
	return true

func get_dir() -> Vector2:
	return dir
	
func get_held_frames() -> int:
	return held_frame_count

func get_dir_string_numpad() -> String:
	var dir_string = ""
	
	match dir:
		# numberpad notation
		Vector2(-1,-1):
			dir_string = "1"
		Vector2(0,-1):
			dir_string = "2"
		Vector2(1,-1):
			dir_string = "3"
		Vector2(-1,0):
			dir_string = "4"
		Vector2(0,0):
			dir_string = "5"
		Vector2(1,0):
			dir_string = "6"
		Vector2(-1,1):
			dir_string = "7"
		Vector2(0,1):
			dir_string = "8"
		Vector2(1,1):
			dir_string = "9"
	return dir_string

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
	
	return dir_string + ", held for " + str(held_frame_count) + " frames"
