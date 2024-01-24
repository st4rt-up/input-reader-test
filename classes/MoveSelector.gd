extends Node
class_name MoveSelector

# probably an interface?
# connected to the character state machine

func _check_input_numpad(numpad_input_string: String, input_window: int, buffer_size: int) -> bool:
	# implement later
	return false

func _check_charge_input(charge_input_string: String, release_input_string: String, charge_time) -> bool:
	# implement later
	return false
