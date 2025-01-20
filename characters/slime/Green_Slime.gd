extends CharacterBody2D

@onready var gem = preload("res://Items/gem.tscn")
@onready var player = get_node("../Player")
@export var instance_module = Color(1.0 , 1.0, 1.0)
@export var SPEED = 300
@export var Enemy_Type : String = "Green_Slime"
@export var Exp : int = 1

var default_ai = true

func _ready():
	modulate = instance_module
	if Enemy_Type.to_upper() != 'IMMORTAL_SLIME':  # checking name of node
		get_node("Slime").play_walk()

func _physics_process(delta):
	handle_ai(delta)
	move_and_slide()

func handle_ai(delta):
	if default_ai:
		update_movement()

func update_movement():
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED

func drop_items():
	var loot = gem.instantiate()  
	loot.name = 'Gem'
	loot.position = global_position  
	get_parent().add_child(loot)  
