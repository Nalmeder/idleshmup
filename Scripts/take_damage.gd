extends Node2D

@export var contact_damage = 0

func apply_damage(amount):
	if get_parent().has_node("health_component"):
		var health_component = get_parent().get_node("health_component")
		health_component.reduce_health(amount)
	""" else:
		print("No health component found!") """
