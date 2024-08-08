extends Node2D
class_name RootLevel

@onready var player = $Player
@onready var projectiles = $Projectiles
@onready var ui = $UI
@onready var items = $Items

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/objects/item.tscn")

func _ready():
	var containers = get_tree().get_nodes_in_group("containers")
	for container in containers:
		container.connect('open', _on_container_opened)

func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	items.call_deferred("add_child", item)

func _on_player_laser(laser_position, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = laser_position
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	projectiles.add_child(laser)


func _on_player_grenade(grenade_position, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_position
	grenade.linear_velocity = direction * grenade.speed
	projectiles.add_child(grenade)
