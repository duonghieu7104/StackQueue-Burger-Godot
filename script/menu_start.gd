extends Node2D


@onready var audio_player = $AudioStreamPlayer2D


func _ready():
	pass

func _process(delta):
	pass

func _on_button_pressed():
	audio_player.play()
	$save_load.load()
	get_tree().change_scene_to_file("res://scene/map.tscn")

func _on_button_2_pressed():
	audio_player.play()
	get_tree().change_scene_to_file("res://scene/map.tscn")

func _on_button_3_pressed():
	audio_player.play()
	get_tree().quit()
