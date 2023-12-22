extends Node2D
@onready var audio_player = $AudioStreamPlayer2D
@onready var animation_coin = $AnimatedSprite2D

func _ready():
	pass

func _process(delta):
	$coin.text = "%s" %Singletons.coin
	if Singletons.coin < 0:
		get_tree().quit()
	animation_coin.play("coin")
	
func _on_open_shop_pressed():
	#$open_store.visible = not $open_store.visible
	#$setting.visible  = not $setting.visible
	audio_player.play()
	$shop_buy.visible = not $shop_buy.visible

func _on_open_store_pressed():
	#$open_shop.visible = not $open_shop.visible
	#$setting.visible  = not $setting.visible
	audio_player.play()
	$store.visible = not $store.visible

func _on_menu_save_pressed():
	#$open_shop.visible = not $open_shop.visible
	#$open_store.visible = not $open_store.visible
	audio_player.play()
	$menu_save.visible = not $menu_save.visible


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
