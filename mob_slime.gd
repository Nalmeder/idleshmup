extends CharacterBody2D

const SPEED = 400

@onready var player = get_node("../Player")

func _ready():
	get_node("Slime").play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()

