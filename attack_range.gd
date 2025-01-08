extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		print("in range", target_enemy.global_position)
		shoot()
		
func shoot():
	print("BANG")
	const BULLET = preload("res://Attacks/bullet.tscn")  # make projectile by loading scene
	var player_location = $"..".global_position
	var new_bullet = BULLET.instantiate()                # instantiate the scene
	new_bullet.global_position = player_location         # set position of instantiated scene
	$"..".add_child(new_bullet)                          # create instance of projectile on node
