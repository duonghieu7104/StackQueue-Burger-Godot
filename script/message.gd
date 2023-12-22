extends Node2D

func _ready():
	pass

func _process(delta):
	if Singletons.bool_mess_true:
		_message_buy_true()
	if Singletons.bool_mess_false:
		_message_buy_false()

func _message_buy_true():
	$message.text = "Thanh cong"
	$Timer.start(0.5)

func _message_buy_false():
	$message.text = "Sai te le"
	$Timer.start(0.5)

func _on_timer_timeout():
	$message.text = ""
	Singletons.bool_mess_false = false
	Singletons.bool_mess_true = false
