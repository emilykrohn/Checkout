extends RigidBody2D



func _on_object_detector_area_entered(area):
	print(area)
	if area.name == "Object":
		get_parent().can_move = false
