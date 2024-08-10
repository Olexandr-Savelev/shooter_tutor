extends RigidBody2D

@onready var animation_player = $AnimationPlayer
@onready var explosion = $Explosion

const speed: int = 1800
const explosive_area: int = 300
var targets: Array
var hit_targets: Dictionary
var is_exploded: bool = false
var current_target

func _ready():
	targets = get_tree().get_nodes_in_group('entity') + get_tree().get_nodes_in_group('containers')

func _process(_delta):
	if is_exploded:
		for target in targets:
			if target != null:
				if target.global_position.distance_to(global_position) <= explosive_area:
					if not target in hit_targets:
						if target.has_method('hit'):
							current_target = target
							target.hit()
							hit_targets[target] = null
							var timer = Timer.new()
							timer.connect('timeout', hit_on_timeout)
							timer.autostart = true
							timer.wait_time = 0.5
							add_child(timer)


func hit_on_timeout():
	if current_target != null:
		current_target.hit()


func explode():
	is_exploded = true
	animation_player.play("explosion")

	
 
