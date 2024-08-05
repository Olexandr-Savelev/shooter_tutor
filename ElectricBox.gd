extends ItemContainer
@onready var spark_emitting_timer = $SparkEmittingTimer
@onready var animation_player = $AnimationPlayer


func _ready():
	spark_emitting_timer.start()

func printMsg():
	print('TIMER')

func hit():
	print('electric box')


func _on_spark_emitting_timer_timeout():
	animation_player.play('spark')
	spark_emitting_timer.start()
