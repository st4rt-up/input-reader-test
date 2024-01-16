extends HBoxContainer

var OFFSET: int = 130

func update_display(buffer: Array):
	for child in self.get_children():
		child.queue_free()
	
	var x_pos = 0
	
	for i in range(buffer.size(), 0 ,-1):
		
		var input:InputObject = buffer[i - 1]
		var sprite = Sprite2D.new()
		
		var label = Label.new()
		label.text = input.get_held_frames_string()
		label.add_theme_font_size_override("font_size", 34)
		sprite.position = Vector2(x_pos, 0)
		label.position = Vector2(x_pos * 10, 0)
		
		match input.get_dir_numpad():
			"1":
				sprite.texture = load("res://sprites/arrow_down_left.png")
			"2":
				sprite.texture = load("res://sprites/arrow_down.png")
			"3":
				sprite.texture = load("res://sprites/arrow_down_right.png")
			"4":
				sprite.texture = load("res://sprites/arrow_left.png")
			#"5":
				#sprite.texture = load("res://sprites/neutral.png")
			"6":
				sprite.texture = load("res://sprites/arrow_right.png")
			"7":
				sprite.texture = load("res://sprites/arrow_up_left.png")
			"8":
				sprite.texture = load("res://sprites/arrow_up.png")
			"9":
				sprite.texture = load("res://sprites/arrow_up_right.png")
		
		if input.get_dir_numpad() != "5":
			x_pos += OFFSET
			
		add_child(label)
		add_child(sprite)
