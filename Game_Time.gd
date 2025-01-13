extends Timer

@onready var time_label = %Time_Label
var elapsed_seconds = 0
signal new_wave
const NEW_WAVE = 30 

func _physics_process(delta):
	if time_left < 0.1:  # For some reason in this project my timers will NOT go to zero.
		_on_timeout()

func get_time(elapsed_time):
	var time_string = "Time: 0:"
	if (elapsed_time % 60) < 10:
		time_string = str(time_string, "0", elapsed_time)
	else:
		time_string = str(time_string, elapsed_time)
	if elapsed_time > 60:
		time_string = str(int(elapsed_time/60), time_string)
	return time_string

func _on_timeout():
	elapsed_seconds += 1
	if elapsed_seconds % NEW_WAVE == 0:
		emit_signal("new_wave")
	time_label.text = get_time(elapsed_seconds)
	start()
