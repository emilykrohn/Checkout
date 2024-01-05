extends StaticBody2D


func _on_object_body_entered(body):
	if body.is_in_group("Customers"):
		body.grab_direction = "grab_up"
