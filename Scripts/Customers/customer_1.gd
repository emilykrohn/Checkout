extends RigidBody2D

func _ready():
	add_to_group("Customers")

func _on_object_detector_area_entered(area):
	if area.name == "Object":
		get_parent().can_move = false
		$Timer.start()

func _on_timer_timeout():
	get_parent().can_move = true

func _on_customer_detector_body_entered(body):
	if body.is_in_group("Customers"):
		get_parent().can_move = false

func _on_customer_detector_body_exited(body):
	if body.is_in_group("Customers"):
		get_parent().can_move = true
