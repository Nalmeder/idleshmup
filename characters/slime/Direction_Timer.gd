extends "res://Modified_Timer.gd"

signal direction_lock
signal stop_movement

var toggle = 1

func _on_timeout():
	if toggle == 1:
		emit_signal('direction_lock')
	else:
		emit_signal('stop_movement')
	toggle *= -1
	start()
