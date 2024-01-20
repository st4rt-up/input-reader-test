class_name InputBuffer

# only creates the buffer, then passes it to a MoveSelector class
var BUFFER_MAX_SIZE = 15

var buffer = [InputObject.new()]
var this_frame: InputObject = null
var last_frame: InputObject = InputObject.new()

var facing_right: bool = true

@export var input_reader: InputReader

func _physics_process(_delta) -> void:
	this_frame = InputObject.new()
	this_frame.dir = input_reader.get_direction_numpad()
	
	# buffer[0] is the most recent input
	if this_frame.equals(last_frame):
		buffer[0].held_frame_count += 1
	else:
		# TESTING DEBUG CODE
		# label_buffer.text += buffer[0].everything_to_string() + '\n'
		buffer.insert(0, this_frame)


