class_name InputReader
extends Node2D

var BUFFER_MAX_SIZE = 15

var buffer = [InputObject.new()]
var this_frame: InputObject = null
var last_frame: InputObject = InputObject.new()

# for testing
var facing = Vector2(1,0)

@export var label_buffer: Label
@export var label_input: Label
@export var label_pressed: Label
@export var buffer_display: HBoxContainer

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
		# TESTING DEBUG CODE
		# label_buffer.text += buffer[0].everything_to_string() + '\n'
		buffer.insert(0, this_frame)
		
		
	
	# MORE TESTING DEBUG CODE	
	label_input.text = buffer_to_string()
	buffer_display.update_display(buffer.slice(0, 7))
	
	# remove old inputs from buffer
	
	if buffer.size() >= BUFFER_MAX_SIZE:
		buffer = buffer.slice(0, BUFFER_MAX_SIZE)
	
	# code for button press, temporary for testing 
	
	if Input.is_action_just_pressed("game_action_1"):
		# label_input.text = ""
		label_buffer.text = ""
		var used_up: bool = false
		
		if _check_input_numpad("F2BU", 30, 7) == true and not used_up:
			label_pressed.text = "360"
			used_up = true
		
		if _check_input_numpad("6246", 25, 7) == true and not used_up:
			label_pressed.text = "SUPER !!!"
			used_up = true
			
		if _check_input_numpad("2626", 30, 7) == true and not used_up:
			label_pressed.text = "DOUBLE QUARTER CIRCLE FORWARDS"
			used_up = true
			
		if _check_input_numpad("2424", 30, 7) == true and not used_up:
			label_pressed.text = "DOUBLE QUARTER CIRCLE BACKWARDS"
			used_up = true
		
		if _check_input_numpad("4DD6", 20, 7) == true and not used_up:
			label_pressed.text = "HALF CIRCLE FORWARDS"
			used_up = true
		
		if _check_input_numpad("6DD4", 20, 7) == true and not used_up:
			label_pressed.text = "HALF CIRCLE BACKWARDS"
			used_up = true
			
		if _check_input_numpad("623", 30, 5) == true and not used_up:
			label_pressed.text = "DRAGON PUNCH"
			used_up = true
		
		if _check_input_numpad("421", 30, 5) == true and not used_up:
			label_pressed.text = "BACKWARDS DRAGON PUNCH"
			used_up = true

		if _check_input_numpad("236", 30, 7) == true and not used_up:
			label_pressed.text = "QUARTER CIRCLE FORWARDS"
			used_up = true
		
		if _check_input_numpad("214", 30, 7) == true and not used_up:
			label_pressed.text = "QUARTER CIRCLE BACKWARDS"
			used_up = true
		
		if not used_up:
			label_pressed.text = "BUTTON"
	
	last_frame = this_frame

func _clear_buffer() -> void:
	buffer = [InputObject.new()]

func get_buffer() -> Array:
	return buffer

func buffer_to_string() -> String:
	var string = ""
	for input in buffer:
		string = InputObject.vec_to_numpad_string(input.get_dir()) + " " + string
	
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

func _check_input_numpad(numpad_input_string: String, input_window: int, buffer_size: int) -> bool:
	var recent = buffer.slice(0, buffer_size)
	
	var reversed_numpad_input_string: String = ""
	for i in range(numpad_input_string.length() - 1, -1, -1):
		reversed_numpad_input_string += numpad_input_string[i]

	var counter = 0
	var total_frames = 0
	
	for input in recent:		
		if counter < numpad_input_string.length():
			match reversed_numpad_input_string[counter]:
				"1":
					if input.get_dir() == Vector2(-1, -1):
						counter += 1
				"2":
					if input.get_dir() == Vector2(0,-1):
						counter += 1
				"3":
					if input.get_dir() == Vector2(1,-1):
						counter += 1
				"4":
					if input.get_dir() == Vector2(-1,0):
						counter += 1
				"5":
					if input.get_dir() == Vector2(0, 0):
						counter += 1
				"6":
					if input.get_dir() == Vector2(1,0):
						counter += 1
				"7":
					if input.get_dir() == Vector2(-1,1):
						counter += 1
				"8":
					if input.get_dir() == Vector2(0,1):
						counter += 1
				"9":
					if input.get_dir() == Vector2(1,1):
						counter += 1
				"U":
					if input.get_dir().y > 0:
						counter += 1
				"D":
					if input.get_dir().y < 0:
						counter += 1
				"F":
					if input.get_dir().x > 0:
						counter += 1
				"B":
					if input.get_dir().x < 0:
						counter += 1
			
		if counter != numpad_input_string.length():
			total_frames += input.get_held_frames()

	if counter == numpad_input_string.length() and total_frames <= input_window:
		return true
	else:
		return false

func _check_charge_input(input_string: String, charge_time) -> bool:
	
	var charging_dir: String
	var release_dir: String
	return false
