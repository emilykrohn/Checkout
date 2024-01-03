extends RigidBody2D



func _on_object_detector_area_entered(area):
	if area.name == "Object":
		get_parent().can_move = false
		$Timer.start()


func _on_timer_timeout():
	get_parent().can_move = true
