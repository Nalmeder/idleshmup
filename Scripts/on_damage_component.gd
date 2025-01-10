extends Node2D

func check_frames(i_frame_length: int):
	if %"I-Frames".time_left <= 0.05:
		adjust_opacity(1.0)
		%"I-Frames".stop()
			
	if !(%"I-Frames".is_stopped()):  # TODO: State Machine in the future
		flicker(i_frame_length)
	

func flicker(delay: int):
	if Engine.get_frames_drawn() % delay < int((delay/2)):
		adjust_opacity(0.5)
	else:
		adjust_opacity(1.0)
		
		
func adjust_opacity(num):
	get_parent().modulate = Color(num, num ,num)
	
func start_i_frames():
	%"I-Frames".start()


	
