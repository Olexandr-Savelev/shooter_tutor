extends ItemContainer

@onready var lid_sprite = $LidSprite
@onready var spawn_positions = $SpawnPositions

func hit():
	if not is_opened:
		lid_sprite.hide()
		is_opened = true
		for item in range(3):
			var spawn_position = spawn_positions.get_child(randi() % spawn_positions.get_child_count()).global_position
			open.emit(spawn_position, current_direction)
