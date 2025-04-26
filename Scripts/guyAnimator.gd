extends Node2D

@export var guy_movement: GuyController
@export var animation_player: AnimationPlayer
@export var sprite: Sprite2D

func _process(_delta):
	if guy_movement.velocity.x > 0:
		sprite.flip_h = false
	elif guy_movement.velocity.x < 0:
		sprite.flip_h = true
		
	if abs(guy_movement.velocity.x) > 0.0:
		animation_player.play("Walk")
	else:
		animation_player.play("Idle")
		
	if guy_movement.velocity.y < 0.0:
		animation_player.play("Jump")
	elif guy_movement.velocity.y > 0.0:
		animation_player.play("Fall")
