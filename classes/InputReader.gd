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

func get_direction_numpad_absolute() -> int:
		var direction = Vector2(0,0)
	
		if Input.is_action_pressed(left):
			direction.x -= 1
		
		if Input.is_action_pressed(right):
			direction.x += 1

		if Input.is_action_pressed(up):
			direction.y -= 1
		
		if Input.is_action_pressed(down):
			direction.y += 1
		
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

func get_pressed_actions() -> Array:
	# return an array of buttons pressed, heavies are added first and have priority
	# the buttons that are added first to the array have higher priority
	# this button array will be traversed and the first valid input will be taken
	
	var buttons_array: Array = []
	
	if Input.is_action_pressed("game_action_5"):
		buttons_array.append(create_button_obj(5))
	
	if Input.is_action_pressed("game_action_4"):
		buttons_array.append(create_button_obj(4))
	
	if Input.is_action_pressed("game_action_3"):
		buttons_array.append(create_button_obj(3))
	
	if Input.is_action_pressed("game_action_2"):
		buttons_array.append(create_button_obj(2))
	
	if Input.is_action_pressed("game_action_1"):
		buttons_array.append(create_button_obj(1))
	
	if Input.is_action_pressed("game_action_dash"):
		buttons_array.append(create_button_obj(6))
		
	return buttons_array

func create_button_obj(action: ButtonObj.Action) -> ButtonObj:
	# helper function
	var button = ButtonObj.new()
	button.set_action(action)
	return button
	
