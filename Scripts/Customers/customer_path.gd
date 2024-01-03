extends PathFollow2D

const SPEED := 0.06
var can_move := true

func _process(delta):
	if can_move:
		progress_ratio += SPEED * delta
