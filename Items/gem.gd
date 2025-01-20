extends Node2D

var speed = 0
var target

@export var gem_value : int = 1

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 5*delta
