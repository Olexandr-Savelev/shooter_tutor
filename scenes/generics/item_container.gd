extends StaticBody2D
class_name ItemContainer

@onready var current_direction = Vector2.DOWN.rotated(rotation)
signal open
var is_opened: bool = false

func hit():
	print('container')

