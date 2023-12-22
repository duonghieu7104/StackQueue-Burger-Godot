extends Node

var start_x : float = 60

#Script location

func _ready():
	pass
	
func increase_start_x():
	start_x += 80
	
func reset_start_x():
	start_x = 60
	
func get_start_x() -> float:
	return start_x
