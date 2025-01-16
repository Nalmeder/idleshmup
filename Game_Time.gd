extends "res://Modified_Timer.gd"

@onready var time_label = %Time_Label
var elapsed_seconds = 0
signal new_wave
const NEW_WAVE = 30 

func get_time(elapsed_time):
	var time_string = ":"
	var minutes = int(elapsed_time/60)
	var seconds = elapsed_time % 60
	
	# handle right half of colon
	if seconds < 10:
		time_string = str(time_string, "0", seconds)
	else:
		time_string = str(time_string, seconds)
	
	return str("Time: ", minutes, time_string)

func _on_timeout():
	elapsed_seconds += 1
	if elapsed_seconds % NEW_WAVE == 0:
		emit_signal("new_wave")
	time_label.text = get_time(elapsed_seconds)
	start()
