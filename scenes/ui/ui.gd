extends CanvasLayer

var green: Color = Color("43b691")
var red: Color = Color("dd210e")

@onready var laser_label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar = $HealthBar/TexureProgressBar


func _ready():
	Globals.connect("health_change", update_health)
	Globals.connect("laser_amount_change", update_laser_count)
	Globals.connect("grenade_amount_change", update_grenade_count)
	update_laser_count()
	update_grenade_count()
	update_health()

func update_laser_count():
	var laser_amount = Globals.laser_amount
	laser_label.text = str(laser_amount)
	update_color(laser_amount, laser_label, laser_icon)

func update_grenade_count():
	var grenade_amount = Globals.grenade_amount
	grenade_label.text = str(grenade_amount)
	update_color(grenade_amount, grenade_label, grenade_icon)
	
func update_health():
	var health = Globals.health_amount
	health_bar.value = health

func update_color(amount: int, label: Label, icon: TextureRect) -> void: 
	if amount > 0:
		label.modulate = green
		icon.modulate = green
	else:
		label.modulate = red
		icon.modulate = red
		
