extends Label

@export var inputReader: InputReader

func _physics_process(delta):
	
	if !inputReader.this_frame.equals(inputReader.last_frame):
		inputReader.buffer[0].held_frame_count += 1
	else:
		if inputReader.buffer.size() > 0:
			self.text = inputReader.buffer[0].frames_to_string()
	
	
