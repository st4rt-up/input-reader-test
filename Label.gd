extends Label

@export var inputReader: InputReader

func _physics_process(delta):
	_set_text_1()
	
func _set_text_1():
	match inputReader.get_dir():
		# numberpad notation
		Vector2(-1,-1):
			self.text = "DOWN + LEFT (1)"
		Vector2(0,-1):
			self.text = "DOWN (2)"
		Vector2(1,-1):
			self.text = "DOWN + RIGHT (3) "
		Vector2(-1,0):
			self.text = "LEFT (4)"
		Vector2(0,0):
			self.text = "NEUTRAL (5)"
		Vector2(1,0):
			self.text = "RIGHT (6)"
		Vector2(-1,1):
			self.text = "UP + LEFT (7)"
		Vector2(0,1):
			self.text = "UP (8)"
		Vector2(1,1):
			self.text = "UP + RIGHT (9)"



