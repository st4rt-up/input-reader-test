class_name InputObject

var direction: DirectionObj
var button: ButtonObj

# combines buttonobj and directionobj to make comparaison easier

func equals(input_obj: InputObject) -> bool:
	# implement later
	# does not compare held frames
	return true

func get_button_held_frames() -> int:
	# implement later
	return 0

func get_button_held_frames_string() -> String:
	# implement later
	return ""

func get_direction_held_frames() -> int:
	# implement later
	return 0

func get_direction_held_frames_string() -> String:
	# implement later
	return ""

func get_direction() -> DirectionObj:
	return direction

func get_button() -> ButtonObj:
	return button
	
func _to_string():
	# implement later
	return ""
