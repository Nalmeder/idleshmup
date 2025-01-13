extends Timer

func _physics_process(delta):
	if time_left < 0.1:  # For some reason in this project my timers will NOT go to zero.
		_on_timeout()

func _on_timeout():
	pass
