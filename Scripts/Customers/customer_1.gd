extends RigidBody2D

func _on_area_2d_body_entered(body):
	get_parent().can_move = false


func _on_area_2d_body_exited(body):
	get_parent().can_move = true


func _on_area_2d_area_entered(area):
	get_parent().can_move = false
