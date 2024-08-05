extends RootLevel


func _on_area_2d_body_entered(_body):
	var tween = create_tween()
	tween.tween_property(player, 'speed', 0, 0.5)
