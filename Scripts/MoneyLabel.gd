extends Label

var amount := 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "Money: " + str(amount)
