extends Node

var customer1 = preload("res://Scenes/CustomerPaths/customer_1_path.tscn")
var customer2 = preload("res://Scenes/CustomerPaths/customer_2_path.tscn")

var customers = [customer1]
@onready var paths = [$Path1, $Path2]


func _on_timer_timeout():
	var customer = customers[randi() % customers.size()].instantiate()
	var path = paths[randi() % paths.size()]
	path.add_child(customer)
