extends CharacterBody2D

const SPEED = 700.0

var move_direction

# @onready var sprite = get_node("HappyBoo/AnimationPlayer")

func _physics_process(delta):
	_update_move_direction()
	_apply_movement()

func _update_move_direction():
	move_direction = Input.get_axis("ui_left", "ui_right")

func _apply_movement():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
		
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
