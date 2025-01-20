extends CharacterBody2D

@onready var slime = get_parent()

func _ready():
	slime.default_ai = false

func _on_direction_timer_direction_lock():
	if slime.player:
		update_movement(slime.SPEED)
		
func _on_direction_timer_stop_movement():
	if slime.player:
		update_movement(0)
		
func update_movement(speed):
	var direction = slime.global_position.direction_to(slime.player.global_position)
	slime.velocity = direction * speed


