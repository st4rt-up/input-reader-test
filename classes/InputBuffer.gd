extends Node
class_name InputBuffer

# takes inputs from input reader, puts them into buffer
# this buffer will be passed to MoveSelector

var BUFFER_MAX_SIZE = 15

var buffer: Array[InputObject] = [InputObject.new()]
var this_frame: InputObject = null
var last_frame: InputObject = InputObject.new()

var facing_right: bool = true

@export var input_reader: InputReader

func _physics_process(_delta) -> void:
	this_frame = InputObject.new()
	
	if input_reader:
		this_frame.dir = input_reader.get_direction_numpad()
		this_frame.buttons = input_reader.get_pressed_actions()
	else:
		print("Error: Input reader is not set in input buffer")
		return
	
	# buffer[0] is the most recent input
	if this_frame.equals(last_frame):
		buffer[0].increment_held_frames()
	else:
		buffer.insert(0, this_frame)
		
func _to_string() -> String:
	# implement later
	return ""
