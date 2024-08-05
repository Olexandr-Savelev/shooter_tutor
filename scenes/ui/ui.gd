extends CanvasLayer

@onready var laser_label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label = $GrenadeCounter/VBoxContainer/Label

func update_laser_count():
	laser_label.text = str(Globals.laser_amount)

func update_grenade_count():
	grenade_label.text = str(Globals.grenade_amount)
