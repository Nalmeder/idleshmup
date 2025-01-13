extends Node2D

@export var max_health: int = 3  # default value
var current_health: int          # prototype value
signal entity_hit

func _ready():
	current_health = max_health  # Initialize health
	

func reduce_health(amount):
	current_health -= amount
	emit_signal('entity_hit')
	# print("Health reduced by ", amount, ". Current health: ", current_health)
	
	if current_health <= 0:
		die()

func die():
	get_parent().queue_free()    # Destroy the parent
