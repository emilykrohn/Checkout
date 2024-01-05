extends RigidBody2D

@onready var last_position = global_position
@onready var walk_sprite = $WalkAnimation
@onready var grab_sprite = $GrabAnimation

var grab_direction := ""
var cooldown := true
var total := 0

var is_up := false
var is_right := false
var is_down := false
var is_left := false

func _ready():
	add_to_group("Customers")
	
func _process(_delta):
	customer_detector(last_position - global_position)
	last_position = global_position
	if not is_right and not is_left and not is_down and not is_up and cooldown:
		get_parent().can_move = true

func customer_detector(direction: Vector2):
	if direction.x < 0 and abs(direction.x) > abs(direction.y):
		if is_right:
			get_parent().can_move = false
		walk_sprite.play("walk_right")
	if direction.x > 0 and abs(direction.x) > abs(direction.y):
		if is_left:
			get_parent().can_move = false
		walk_sprite.play("walk_left")
	if direction.y < 0 and abs(direction.y) > abs(direction.x):
		if is_down:
			get_parent().can_move = false
		walk_sprite.play("walk_down")
	if direction.y > 0 and abs(direction.y) > abs(direction.x):
		if is_up:
			get_parent().can_move = false
		walk_sprite.play("walk_up")
	if direction == Vector2.ZERO:
		grab_sprite.play(grab_direction)
		$WalkAnimation.visible = false
		$GrabAnimation.visible = true
	else:
		$WalkAnimation.visible = true
		$GrabAnimation.visible = false

func _on_object_detector_area_entered(area):
	if area.name == "Object":
		total += 1
		cooldown = false
		get_parent().can_move = false
		$Timer.start()
	if area.name == "Register":
		grab_direction = "grab_up"
		$"../../../../Control/Panel/MoneyLabel".amount += total
		cooldown = false
		get_parent().can_move = false
		$Timer.start()

func _on_timer_timeout():
	get_parent().can_move = true
	cooldown = true

func _on_customer_detector_body_exited(body):
	if body.name == "Customer1":
		get_parent().can_move = true

func _on_customer_detector_up_body_entered(body):
	if body.name == "Customer1":
		is_up = true

func _on_customer_detector_up_body_exited(body):
	if body.name == "Customer1":
		is_up = false

func _on_customer_detector_right_body_entered(body):
	if body.name == "Customer1":
		is_right = true

func _on_customer_detector_right_body_exited(body):
	if body.name == "Customer1":
		is_right = false

func _on_customer_detector_down_body_entered(body):
	if body.name == "Customer1":
		is_down = true

func _on_customer_detector_down_body_exited(body):
	if body.name == "Customer1":
		is_down = false

func _on_customer_detector_left_body_entered(body):
	if body.name == "Customer1":
		is_left = true

func _on_customer_detector_left_body_exited(body):
	if body.name == "Customer1":
		is_left = false
