class_name InputObject

var direction: DirectionObj
var buttons : Array[ButtonObj] = []
var held_frames: int = 1
# combines buttonobj and directionobj to make comparaison easier

func equals(input_obj: InputObject) -> bool:
	# implement later
	# does not compare held frames
	return true
	
func increment_held_frames() -> void:
	held_frames += 1
	direction.held_frames += 1
	
	for button in buttons:
		button.held_frames += 1

func get_held_frames() -> int:
	# implement later
	return 0

func get_held_frames_string() -> String:
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

func get_buttons() -> Array:
	return buttons
	
func _to_string():
	# implement later
	return ""
