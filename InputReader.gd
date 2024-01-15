class_name InputReader
extends Node2D

var buffer = [InputObject.new()]

var this_frame: InputObject = null
var last_frame: InputObject = InputObject.new()

# for testing
var facing = Vector2(1,0)

@export var label_buffer: Label
@export var label_input: Label
@export var label_pressed: Label

var up: String = "game_up"
var down: String = "game_down"
var left: String = "game_left"
var right: String = "game_right"

func _physics_process(delta) -> void:
	this_frame = InputObject.new()
	this_frame.dir = get_dir()
	
	# buffer[0] is the most recent input
	if this_frame.equals(last_frame):
		buffer[0].held_frame_count += 1
	else:
		buffer.insert(0, this_frame)
		
		# TESTING DEBUG CODE
		label_buffer.text += buffer[0].everything_to_string() + '\n'
	
	# MORE TESTING DEBUG CODE	
	label_input.text = buffer_to_string()
	
	if get_buffer_total_length() > 150 and buffer.size() > 1:
		buffer.pop_back()
	
	# remove old inputs from buffer
	if buffer.size() >= 10:
		buffer = buffer.slice(0,10)
	
	# code for button press, temporary for testing 
	
	if Input.is_action_just_pressed("game_action_1"):
		# label_input.text = ""
		label_buffer.text = ""
		var used_up: bool = false
		
		if _check_41236() == true and not used_up:
			label_pressed.text = "HALF CIRCLE FORWARDS"
			used_up = true
			_clear_buffer()
			
		if _check_623() == true and not used_up:
			label_pressed.text = "DRAGON PUNCH !!!!!!!"
			used_up = true
			_clear_buffer()
		
		if _check_236() == true and not used_up:
			label_pressed.text = "QUARTER CIRCLE FORWARDS"
			used_up = true
			_clear_buffer()
		
		if not used_up:
			label_pressed.text = "BUTTON"
	
	last_frame = this_frame

func _clear_buffer() -> void:
	buffer = [InputObject.new()]

func _check_input(input, frames) -> void:
	pass
	
func numpad_to_vec(input: int) -> Vector2:
	# to implement
	return Vector2(0,0)
	
func vec_to_numpad(input: Vector2) -> int:
	# to implement
	return 5

func numpad_to_vec_array(input: int) -> Array:
	# wrapper function, to implement
	return []

func get_buffer() -> Array:
	return buffer

func buffer_to_string() -> String:
	var string = ""
	for val in buffer:
		string = val.get_dir_string_numpad() + " " + string
	
	return string

func get_buffer_total_length() -> int:
	var total_frames: int = 0
	for input in buffer:
		total_frames += input.get_held_frames()
	
	return total_frames

func get_dir() -> Vector2:
	var dir = Vector2(0,0)
	
	if Input.is_action_pressed(left) and !Input.is_action_pressed(right):
		dir.x = -1
	elif Input.is_action_pressed(right) and !Input.is_action_pressed(left):
		dir.x = 1
	else:
		dir.x = 0
		
	if Input.is_action_pressed(up) and !Input.is_action_pressed(down):
		dir.y = 1 
	elif Input.is_action_pressed(down) and !Input.is_action_pressed(up):
		dir.y = -1
	else:
		dir.y = 0
		
	return dir

## TEMP TESTING

func _check_41236() -> bool:
	var recent = buffer.slice(0,7)
	
	var counter = 0
	var total_frames = 0
	for input in recent:
		
		if input.get_dir() == Vector2(1, 0) and counter == 0:
			counter += 1
		
		if input.get_dir() == Vector2(0, -1) and counter == 1:
			counter += 1
			
		if input.get_dir() == Vector2(-1, 0) and counter == 2:
			counter += 1
		
		if counter != 3:
			total_frames += input.get_held_frames()
	
	if counter == 3 and total_frames <= 80:
		
		return true
	else:
		return false

func _check_623() -> bool:
	var recent = buffer.slice(0,7)
	
	var counter = 0
	var total_frames = 0
	for input in recent:
		
		if input.get_dir() == Vector2(1, -1) and counter == 0:
			counter += 1
		
		if input.get_dir() == Vector2(0, -1) and counter == 1:
			counter += 1
			
		if input.get_dir() == Vector2(1, 0) and counter == 2:
			counter += 1
		
		if counter != 3:
			total_frames += input.get_held_frames()
	
	if counter == 3 and total_frames <= 25:
		
		return true
	else:
		return false

func _check_236() -> bool:
	var recent = buffer.slice(0,5)
	
	var counter = 0
	var total_frames = 0
	for input in recent:
		
		if input.get_dir() == Vector2(1, 0) and counter == 0:
			counter += 1
		
		if input.get_dir() == Vector2(1, -1) and counter == 1:
			counter += 1
			
		if input.get_dir() == Vector2(0, -1) and counter == 2:
			counter += 1
		
		if counter != 3:
			total_frames += input.get_held_frames()
	
	if counter == 3 and total_frames <= 30:
		print(total_frames)
		return true
	else:
		return false
