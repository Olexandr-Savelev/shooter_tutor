extends CharacterBody2D

var can_laser : bool = true
var can_grenade : bool = true
const speed : int = 500

@onready var player_image = $PlayerImage
@onready var laser_cooldown = $LaserCooldown
@onready var grenade_cooldown = $GrenadeCooldown
@onready var lasers_spawn_markers = $LasersSpawnMarkers
@onready var grenade_spawn_marker = $GrenadeSpawnMarker

signal laser(laser_position, direction)
signal grenade(grenade_position, direction)


func _physics_process(_delta):
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_laser:
		shoot_laser()
	if Input.is_action_pressed("secondary action") and can_grenade:
		shoot_grenade()

func shoot_laser() -> void:
	can_laser = false
	laser_cooldown.start()
	var laser_markers = lasers_spawn_markers.get_children()
	var laser_position : Vector2 = laser_markers[randi() % laser_markers.size()].global_position
	var player_direction = (get_global_mouse_position() - position).normalized()
	laser.emit(laser_position, player_direction)


func shoot_grenade() -> void:
	can_grenade = false
	grenade_cooldown.start()
	var grenade_position : Vector2 = grenade_spawn_marker.get_children()[0].global_position
	var player_direction = (get_global_mouse_position() - position).normalized()
	grenade.emit(grenade_position, player_direction)


func _on_laser_cooldown_timeout():
	can_laser = true


func _on_grenade_cooldown_timeout():
	can_grenade = true
