extends Area2D

@export var speed : int = 2500
var direction : Vector2 = Vector2.UP


func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	print('laser targeted to ' + str(body))
	queue_free()
