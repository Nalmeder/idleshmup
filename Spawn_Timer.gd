extends "res://Modified_Timer.gd"

func _on_timeout():
	emit_signal("timeout")
	start()
