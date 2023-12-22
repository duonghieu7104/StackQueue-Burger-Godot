extends Node2D

@onready var audio_player = $AudioStreamPlayer2D

func _ready():
	pass

func _process(delta):
	$UI.visible = self.visible


func _on_button_pressed():
	self.visible = not self.visible
	audio_player.play()


func _on_button_2_pressed():
	audio_player.play()
	Singletons.new_game()
	get_tree().change_scene_to_file("res://scene/map.tscn")


func _on_button_3_pressed():
	audio_player.play()
	$save_load.hashing_data()
	$save_load.save()
	get_tree().quit()
