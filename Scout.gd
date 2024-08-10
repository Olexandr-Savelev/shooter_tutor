extends CharacterBody2D

var in_range: bool = false
var can_attack: bool = true

@onready var attack_cooldown = $AttackCooldown
@onready var laser_spawn_pos = $LaserSpawnPos
@onready var progress_bar = $ProgressBar
const max_health: int = 80
var health: int

signal attack(pos, direction)

func _ready():
	health = max_health
	progress_bar.max_value = max_health
	progress_bar.value = health	

func _process(_delta):
	if in_range:
		look_at(Globals.player_position)
		if can_attack:
			shoot()


func hit():
	health -= 15
	progress_bar.value = health	
	print(health)
	var tween = create_tween()
	if health<=0:
		tween.tween_property(self,'modulate',Color('ffffff00'),0.6)
		tween.tween_callback(queue_free)
	tween.tween_property(self,'modulate',Color('ff3d19'),0.2)
	tween.tween_property(self,'modulate',Color('ffffff'),0.2)


func shoot():
	attack_cooldown.start()
	can_attack = false
	var laser_pos = laser_spawn_pos.get_child(randi()%laser_spawn_pos.get_child_count()).global_position
	var direction = (Globals.player_position - position).normalized()
	attack.emit(laser_pos, direction)


func _on_attack_area_body_entered(_body):
	in_range = true


func _on_attack_area_body_exited(_body):
	in_range = false


func _on_attack_cooldown_timeout():
	can_attack = true
