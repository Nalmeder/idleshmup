extends Node2D

const GREEN_SLIME = preload("res://characters/slime/Green_Slime.tscn")
const IMMORTAL_SLIME = preload("res://characters/slime/immortal_slime.tscn")
const FAST_SLIME = preload("res://characters/slime/fast_slime.tscn")
const WAVES = [[GREEN_SLIME], [FAST_SLIME, GREEN_SLIME], [IMMORTAL_SLIME], [GREEN_SLIME, IMMORTAL_SLIME]]
var wave_ptr = 0  # unless testing, should be 0

func _ready():
	pass

func spawn_mob(mob):
	var new_mob = mob.instantiate() 
	%Spawn_Path.progress_ratio = randf()
	new_mob.global_position = %Spawn_Path.global_position
	new_mob.Enemy_Type = str(new_mob).split(":")[0]
	#print(new_mob.Enemy_Type)
	add_child(new_mob)
	

func _on_game_time_new_wave():
	print("NEW WAVE!")
	wave_ptr = (wave_ptr + 1) % WAVES.size()


func _on_spawn_timer_timeout():
	var current_list = WAVES[wave_ptr]
	var list_size = current_list.size()
	if list_size == 1:
		spawn_mob(current_list[0])
	else:
		spawn_mob(current_list[randi_range(0, list_size-1)])
