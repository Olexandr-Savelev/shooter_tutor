extends RigidBody2D

@onready var animation_player = $AnimationPlayer
@onready var explosion = $Explosion

const speed = 1800


func explode():
	animation_player.play("explosion")
 
