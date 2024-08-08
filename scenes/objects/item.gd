extends Area2D

@onready var sprite_2d = $Sprite2D

var rotation_speed: int = 4
var avaliable_options: Array = ['laser', 'laser', 'laser', 'grenade', 'health']
var type: String = avaliable_options[randi() % len(avaliable_options)]
var direction: Vector2
var distance = randi_range(150, 300)

func _ready():
	if type == 'laser':
		sprite_2d.modulate = Color(0.1,0.2,0.8)
	elif type == 'grenade':
		sprite_2d.modulate = Color(0.8,0.2,0.1)
	else:
		sprite_2d.modulate = Color(0.2,0.8,0.1)
		
	var target_position = position + direction * distance
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property(self, 'position', target_position, 0.7)
	tween.tween_property(self, 'scale', Vector2(1,1), 0.5).from(Vector2(0.5,0.5))


func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	if body.has_method('get_item'):
		body.get_item(type)
		queue_free()
