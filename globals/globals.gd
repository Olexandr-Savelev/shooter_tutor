extends Node

signal health_change
signal laser_amount_change
signal grenade_amount_change

var laser_amount: int = 20:
	get:
		return laser_amount
	set(val):
		laser_amount = val
		laser_amount_change.emit()
		
var grenade_amount: int = 5:
	get:
		return grenade_amount
	set(val):
		grenade_amount = val
		grenade_amount_change.emit()
		
var health_amount: int = 50:
	get:
		return health_amount
	set(val):
		health_amount = val
		health_change.emit()
