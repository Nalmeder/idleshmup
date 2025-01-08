extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		# print("in range", target_enemy.global_position)
		# print("player", $"..".global_position)
		if $Timer.time_left <= 0.05:
			shoot(target_enemy)
		
		
func shoot(body):
	const BULLET = preload("res://Attacks/bullet.tscn")  # make projectile by loading scene
	var new_bullet = BULLET.instantiate()                # instantiate the scene
	var direction = global_position.direction_to(body.global_position)
	new_bullet.rotation = direction.angle()
	new_bullet.global_position.y = new_bullet.global_position.y - 30
	add_child(new_bullet)                                # create instance of projectile on node
	$Timer.start()
	
	
		
"""
not used, but I predict a problem later that using these incorrectly spawning bullets may help debug
func shoot():
	const BULLET = preload("res://Attacks/bullet.tscn")  # make projectile by loading scene
	var new_bullet = BULLET.instantiate()                # instantiate the scene
	new_bullet.global_position = $"..".global_position   # set position of instantiated scene
	$"..".add_child(new_bullet)                          # create instance of projectile on node
"""
