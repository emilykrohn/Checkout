extends Control

var amount := 0
var level := 0

func _ready():
	pass


func _process(delta):
	$Panel/MoneyLabel.text = "Money: " + str(amount)
	$Panel2/HBoxContainer/ProgressBar.value = level