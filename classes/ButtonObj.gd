class_name ButtonObj

# stores button presses

var held_frames: int = 1
var action: Action

enum Action {
	ACTION_1 = 1,
	ACTION_2 = 2,
	ACTION_3 = 3,
	ACTION_4 = 4,
	ACTION_5 = 5,
	DASH = 6
}

func set_action(new_action: Action) -> void:
	self.action = new_action 

func get_action() -> int:
	return action
	
func get_action_string() -> String:
	var result: String = ""
	
	match action:
		Action.ACTION_1:
			result = "ACTION_1"
		Action.ACTION_2:
			result = "ACTION_2"
		Action.ACTION_3:
			result = "ACTION_3"
		Action.ACTION_4:
			result = "ACTION_4"
		Action.ACTION_5:
			result = "ACTION_5"
	
	return result

func equals(button: ButtonObj) -> bool:
	# does not count held frames
	var equal: bool = (
		button.action == self.action and 
		button.pressed == self.pressed and 
		button.press_used == self.press_used
		)
	
	return equal

func _to_string() -> String:
	# implement later
	return ""
