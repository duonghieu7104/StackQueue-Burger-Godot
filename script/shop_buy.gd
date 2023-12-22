extends Node2D
@onready var audio_player = $AudioStreamPlayer2D
func _ready():
	pass

func _process(delta):
	$count.text = "Bread top: %s" %Singletons.bread_top
	$count2.text = "Ketchup: %s" %Singletons.ketchup
	$count3.text = "Butter: %s" %Singletons.butter
	$count4.text = "Tomato: %s" %Singletons.tomato
	$count5.text = "Cucumber: %s" %Singletons.cucumber
	$count6.text = "Salad: %s" %Singletons.salad
	$count7.text = "Beef: %s" %Singletons.beef
	$count8.text = "Onion: %s" %Singletons.onion
	$count9.text = "Cheese: %s" %Singletons.cheese
	$count10.text = "Bread bottom: %s" %Singletons.bread_bottom
func _on_button_1_10_pressed():
	if check_coin():
		Singletons.buy_bread()
		audio_player.play()
		_message_buy()

func _on_button_2_pressed():
	if check_coin():
		Singletons.buy_ketchup()
		audio_player.play()
		_message_buy()


func _on_button_3_pressed():
	if check_coin():
		Singletons.buy_butter()
		audio_player.play()
		_message_buy()


func _on_button_4_pressed():
	if check_coin():
		Singletons.buy_tomato()
		audio_player.play()
		_message_buy()


func _on_button_5_pressed():
	if check_coin():
		Singletons.buy_cucumber()
		audio_player.play()
		_message_buy()


func _on_button_6_pressed():
	if check_coin():
		Singletons.buy_salad()
		audio_player.play()
		_message_buy()


func _on_button_7_pressed():
	if check_coin():
		Singletons.buy_beef()
		audio_player.play()
		_message_buy()


func _on_button_8_pressed():
	if check_coin():
		Singletons.buy_onion()
		audio_player.play()
		_message_buy()


func _on_button_9_pressed():
	if check_coin():
		Singletons.buy_cheese()
		audio_player.play()
		_message_buy()

func _message_buy():
	$message.text = "Da mua"
	$Timer.start(0.5)

func _message_0_coin():
	$message.text = "Het tien"
	$Timer.start(0.5)

func _on_timer_timeout():
	$message.text = ""

func check_coin() -> bool:
	if Singletons.coin <= 0:
		_message_0_coin()
		return false
	return true
