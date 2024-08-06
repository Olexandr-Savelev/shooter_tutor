extends StaticBody2D

signal player_entered(_body)

func _on_area_2d_body_entered(_body):
	player_entered.emit(_body)

