extends StaticBody2D

@export var blinking : bool = false

var rng = RandomNumberGenerator.new()
var period : float 
var timer : Timer
@onready var point_light_2d = $PointLight2D

func _ready(): 
	if blinking:
		timer = Timer.new()
		get_random_period()
		timer.autostart = true
		timer.wait_time = period
		add_child(timer)
		timer.connect('timeout', toggle_light)

func toggle_light():
	point_light_2d.enabled = not point_light_2d.enabled
	reset_timer()

func reset_timer():
	get_random_period()
	timer.wait_time = period

func get_random_period():
	period = rng.randf_range(0.05, 0.4)