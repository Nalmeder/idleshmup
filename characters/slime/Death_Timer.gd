extends "res://Modified_Timer.gd"

func _on_timeout():
	get_parent().queue_free()

