extends StaticBody2D


func _on_area_2d_body_entered(_body):
	print('Entered')


func _on_area_2d_body_exited(_body):
	print('Left')
