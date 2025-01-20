extends "res://Modified_Timer.gd"

"""
func _ready():
	%TimeBar.max_value = wait_time
"""
func _on_timeout():
	get_parent().queue_free()

"""
func _physics_process(delta):
	%TimeBar.value = time_left"""

