extends Node2D


func play_walk():
	%AnimationPlayer.play("walk")


func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")


func _on_health_component_entity_hit():
	play_hurt()

