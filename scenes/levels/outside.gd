extends RootLevel

func _on_gate_player_entered(_body):
	var tween = create_tween()
	tween.tween_property(player, 'speed', 0, 0.1)
