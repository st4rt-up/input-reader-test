class_name ButtonObj

# stores button presses

var held_frames: int = 1

var action: Action
var pressed: bool = true
var released: bool = false

var press_used: bool = false
var release_used: bool = false

enum Action {
	ACTION_1,
	ACTION_2,
	ACTION_3,
	ACTION_4,
	ACTION_5
}

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
		button.released == self.released and
		button.press_used == self.press_used and
		button.release_used == self.release_used)
	
	return equal
	
