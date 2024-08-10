extends Node

signal health_change
signal laser_amount_change
signal grenade_amount_change

var laser_amount: int = 20:
	set(val):
		laser_amount = val
		laser_amount_change.emit()
		
var grenade_amount: int = 5:
	set(val):
		grenade_amount = val
		grenade_amount_change.emit()
		
var health_amount: int = 50:
	set(val):
		health_amount = val
		health_change.emit()

var player_position: Vector2
