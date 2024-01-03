extends Node

var customer1 = preload("res://Scenes/CustomerPaths/customer_1_path.tscn")
var customer2 = preload("res://Scenes/CustomerPaths/customer_2_path.tscn")

var customers = [customer1, customer2]
@onready var paths = [$Path1, $Path2]


func _on_timer_timeout():
	var customer = customers[randi() % customers.size()].instantiate()
	paths[randi() % paths.size()].add_child(customer)
