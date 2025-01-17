extends Node2D

@export var max_health: int = 3  # default value
var current_health: int          # prototype value
signal entity_hit

func _ready():
	current_health = max_health  # Initialize health
	%HealthBar.value = max_health	 # Initialize full health bar
	%HealthBar.max_value = max_health
	
func _physics_process(delta):
	%HealthBar.value = current_health
	
func reduce_health(amount):
	current_health -= amount
	emit_signal('entity_hit')
	# print("Health reduced by ", amount, ". Current health: ", current_health)
	
	if current_health <= 0:
		die()

func die():
	get_parent().queue_free()    # Destroy the parent
