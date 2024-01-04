extends RigidBody2D

@onready var last_position = global_position

func _ready():
	add_to_group("Customers")
	
func _process(delta):
	hide_customer_detectors()
	customer_detector(last_position - global_position)
	last_position = global_position

func customer_detector(direction: Vector2):
	if direction.x < 0 and abs(direction.x) > abs(direction.y):
		$CustomerDetector/Right.visible = true
	if direction.x > 0 and abs(direction.x) > abs(direction.y):
		$CustomerDetector/Left.visible = true
	if direction.y < 0 and abs(direction.y) > abs(direction.x):
		$CustomerDetector/Down.visible = true
	if direction.y > 0 and abs(direction.y) > abs(direction.x):
		$CustomerDetector/Up.visible = true

func hide_customer_detectors():
	$CustomerDetector/Down.hide()
	$CustomerDetector/Up.hide()
	$CustomerDetector/Left.hide()
	$CustomerDetector/Right.hide()

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
