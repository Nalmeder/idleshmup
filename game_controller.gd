extends Node2D

const GREEN_SLIME = preload("res://characters/slime/Green_Slime.tscn")


func _ready():
	spawn_mob(GREEN_SLIME)
	spawn_mob(GREEN_SLIME)

func spawn_mob(mob):
	var new_mob = mob.instantiate() 
	%Spawn_Path.progress_ratio = randf()
	new_mob.global_position = %Spawn_Path.global_position
	add_child(new_mob)
	

func _on_game_time_new_wave():
	print("NEW WAVE!")
