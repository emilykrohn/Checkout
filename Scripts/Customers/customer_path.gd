extends PathFollow2D

const SPEED := 100
var can_move := true

func _process(delta):
	if can_move:
		progress += SPEED * delta
	if progress_ratio == 1:
		queue_free()
