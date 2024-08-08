extends ItemContainer

@onready var lid_sprite = $LidSprite
@onready var spawn_positions = $SpawnPositions

func hit():
	if not is_opened:
		is_opened = true
		lid_sprite.hide()
		open.emit(spawn_positions.get_child(0).global_position, current_direction)
