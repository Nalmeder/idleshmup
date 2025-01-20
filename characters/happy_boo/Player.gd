extends CharacterBody2D

const SPEED = 700.0

var move_direction
var i_frame_length = 32

var experience = 0
var experience_rate = 1.04
var experience_cap = 5
var level = 1

# @onready var sprite = get_node("HappyBoo/AnimationPlayer")

func _physics_process(delta):
	_update_move_direction()
	_apply_movement()
	
	if %Hurtbox.get_overlapping_bodies():
		var body = %Hurtbox.get_overlapping_bodies()[0]
		if $"on_hit_component/I-Frames".is_stopped():
			$on_hit_component.start_i_frames()
			var dmg = body.get_node("damage_component").contact_damage
			# print(dmg)
			$damage_component.apply_damage(dmg)
			
	if %Grab_Area.get_overlapping_bodies():
		var body = %Grab_Area.get_overlapping_bodies()[0]
		if body.get('gem_value')!=null:
			get_exp(body.gem_value)
			body.queue_free()
			
		
	$on_hit_component.check_frames(i_frame_length)

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

func get_exp(value):
	experience += value
	print(experience)

