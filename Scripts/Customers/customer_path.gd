extends PathFollow2D

const SPEED := 0.06

func _process(delta):
	progress_ratio += SPEED * delta
