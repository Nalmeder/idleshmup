extends CharacterBody2D

@onready var player = get_node("../Player")
@export var instance_module = Color(1.0 , 1.0, 1.0)
@export var SPEED = 300
@export var Enemy_Type : String = "Green_Slime"


func _ready():
	modulate = instance_module
	if Enemy_Type.to_upper() != 'IMMORTAL_SLIME':  # checking name of node
		get_node("Slime").play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()

