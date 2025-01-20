extends Area2D

func _on_body_entered(body):
	if body.gem_value:
		body.target = get_parent()
