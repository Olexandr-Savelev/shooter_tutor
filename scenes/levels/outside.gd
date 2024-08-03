extends RootLevel

func _on_gate_player_entered(_body):
	var tween = create_tween()
	tween.tween_property(player, 'speed', 0, 0.1)

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property(player.get_node('Camera2D'), 'zoom', Vector2(0.8,0.8), 1)


func _on_house_player_left():
	var tween = get_tree().create_tween()
	tween.tween_property(player.get_node('Camera2D'), 'zoom', Vector2(0.5,0.5), 1)
