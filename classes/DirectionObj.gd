class_name DirectionObj

# stores direction inputs, has helper functions

var held_frames: int = 1
var direction: Direction = Direction.NEUTRAL

enum Direction {
	DOWN_BACKWARDS = 1,
	DOWN = 2,
	DOWN_FORWARDS = 3,
	BACKWARDS = 4,
	NEUTRAL = 5,
	FORWARDS = 6,
	UP_BACKWARDS = 7,
	UP = 8,
	UP_FORWARDS = 9
}

func get_direction_numpad() -> String:
	match direction:
		Direction.DOWN_BACKWARDS:
			return "1"
		Direction.DOWN:
			return "2"
		Direction.DOWN_FORWARDS:
			return "3"
		Direction.BACKWARDS:
			return "4"
		Direction.NEUTRAL:
			return "5"
		Direction.FORWARDS:
			return "6"
		Direction.UP_BACKWARDS:
			return "7"
		Direction.UP:
			return "8"
		Direction.UP_FORWARDS:
			return "9"
		
	return "5"
	
func get_direction_string() -> String:
	match direction:
		Direction.DOWN_BACKWARDS:
			return "DOWN_BACKWARDS"
		Direction.DOWN:
			return "DOWN"
		Direction.DOWN_FORWARDS:
			return "DOWN_FORWARDS"
		Direction.BACKWARDS:
			return "BACKWARDS"
		Direction.NEUTRAL:
			return "NEUTRAL"
		Direction.FORWARDS:
			return "FORWARDS"
		Direction.UP_BACKWARDS:
			return "UP_BACKWARDS"
		Direction.UP:
			return "UP"
		Direction.UP_FORWARDS:
			return "UP_FORWARDS"
		
	return "NEUTRAL"

func set_direction_numpad(numpad_input: int) -> void:
	direction = numpad_input

func equals(directionObj: DirectionObj) -> bool:
	var equal: bool = directionObj.direction == self.direction
	
	return equal

func _to_string() -> String:
	# implement later
	return ""
