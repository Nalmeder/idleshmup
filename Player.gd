extends CharacterBody2D

const SPEED = 700.0
var is_damage_state = false  
var move_direction
var i_frame_length = 32

# @onready var sprite = get_node("HappyBoo/AnimationPlayer")

func _physics_process(delta):
	_update_move_direction()
	_apply_movement()
	if %"I-Frames".time_left <= 0.05:
		adjust_opacity(1.0)
		%"I-Frames".stop()
		
	if %Hurtbox.get_overlapping_bodies():
			%"I-Frames".start()
			print('contact')
			
	if !(%"I-Frames".is_stopped()):  # TODO: State Machine in the future
		flicker(i_frame_length)

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
	
	
func flicker(delay: int):
	if Engine.get_frames_drawn() % delay < int((delay/2)):
		adjust_opacity(0.5)
	else:
		adjust_opacity(1.0)
		
		
func adjust_opacity(num):
	modulate = Color(num, num ,num)

