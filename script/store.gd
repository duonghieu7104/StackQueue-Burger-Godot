extends Node2D
@onready var audio_player = $AudioStreamPlayer2D
func _ready():
	pass

func _process(delta):
	$Sprite2D.texture = Singletons.img_thuc_don
	

func _on_de_queue_pressed(): #giao_hang
	globalsignal.start_x -= 80
	self.visible = false
	var current_sprite = queue_sprite.queue1.dequeue()
	if current_sprite == null:
		return
	queue_sprite.count -= 1
	current_sprite.re_spawner()
	
	
	for i in queue_sprite.count:
		var current = queue_sprite.queue1.dequeue()
		current.piling_up_sprite()
		queue_sprite.queue1.enqueue(current)
	
	for i in stack_sprite.count:
		var current = stack_sprite.stack3.pop()
		if current == null:
			return
		print("Stack = ", current)
		Singletons.result *= 10
		Singletons.result += current
	stack_sprite.count = 0
	print("Computer: \n", Singletons.id_thuc_don)
	print("Player: \n", Singletons.result)
	
	if Singletons.result == Singletons.id_thuc_don:
		Singletons.coin += 100
		Singletons.bool_emotes = 1
		#Singletons.bool_mess_true = true
	else:
		Singletons.coin -= 150
		Singletons.bool_emotes = 2
		#Singletons.bool_mess_false = true
	
	Singletons.result = 0
	Singletons.img_thuc_don = null
		
	if not Singletons.thuc_don_queue.is_empty() || not queue_manager.sprite_queue.is_empty():
		var current_var = Singletons.thuc_don_queue.pop_front()
		Singletons.id_thuc_don = current_var.id
		Singletons.img_thuc_don = current_var.img
	reset_tick()

#3 stack
#stack 1 luu sigletons var
#stack 2 luu tick
#stack 3 luu id

func _on_button_1_pressed():
	if check_count(Singletons.bread_top):
		print(1)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.bread_top -= 1
		$Node.count = Singletons.bread_top
		stack_sprite.stack1.push($Node)
		$check_tick.visible = true
		stack_sprite.stack2.push($check_tick)
		stack_sprite.stack3.push(1)

func _on_button_2_pressed():
	if check_count(Singletons.ketchup):
		print(2)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.ketchup -= 1
		$Node2.count = Singletons.ketchup
		stack_sprite.stack1.push($Node2)
		$check_tick2.visible = true
		stack_sprite.stack2.push($check_tick2)
		stack_sprite.stack3.push(2)


func _on_button_3_pressed():
	if check_count(Singletons.butter):
		print(3)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.butter -= 1
		$Node3.count = Singletons.butter
		stack_sprite.stack1.push($Node3)
		$check_tick3.visible = true
		stack_sprite.stack2.push($check_tick3)
		stack_sprite.stack3.push(3)


func _on_button_4_pressed():
	if check_count(Singletons.tomato):
		print(4)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.tomato -= 1
		$Node4.count = Singletons.tomato
		stack_sprite.stack1.push($Node4)
		$check_tick4.visible = true
		stack_sprite.stack2.push($check_tick4)
		stack_sprite.stack3.push(4)


func _on_button_5_pressed():
	if check_count(Singletons.cucumber):
		print(5)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.cucumber -= 1
		$Node5.count = Singletons.cucumber
		stack_sprite.stack1.push($Node5)
		$check_tick5.visible = true
		stack_sprite.stack2.push($check_tick5)
		stack_sprite.stack3.push(5)


func _on_button_6_pressed():
	if check_count(Singletons.salad):
		print(6)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.salad -= 1
		$Node6.count = Singletons.salad
		stack_sprite.stack1.push($Node6)
		$check_tick6.visible = true
		stack_sprite.stack2.push($check_tick6)
		stack_sprite.stack3.push(6)


func _on_button_7_pressed():
	if check_count(Singletons.beef):
		print(7)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.beef -= 1
		$Node7.count = Singletons.beef
		stack_sprite.stack1.push($Node7)
		$check_tick7.visible = true
		stack_sprite.stack2.push($check_tick7)
		stack_sprite.stack3.push(7)


func _on_button_8_pressed():
	if check_count(Singletons.onion):
		print(8)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.onion -= 1
		$Node8.count = Singletons.onion
		stack_sprite.stack1.push($Node8)
		$check_tick8.visible = true
		stack_sprite.stack2.push($check_tick8)
		stack_sprite.stack3.push(8)


func _on_button_9_pressed():
	if check_count(Singletons.cheese):
		print(9)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.cheese -= 1
		$Node9.count = Singletons.cheese
		stack_sprite.stack1.push($Node9)
		$check_tick9.visible = true
		stack_sprite.stack2.push($check_tick9)
		stack_sprite.stack3.push(9)


func _on_button_10_pressed():
	if check_count(Singletons.bread_bottom):
		print(1)
		stack_sprite.count += 1
		audio_player.play()
		Singletons.ketchup -= 1
		$Node10.count = Singletons.bread_bottom
		stack_sprite.stack1.push($Node10)
		$check_tick10.visible = true
		stack_sprite.stack2.push($check_tick10)
		stack_sprite.stack3.push(1)

func _on_pop_pressed():
	#stack 1 luu var count SL
	audio_player.play()
	update_var_count() #cap nhat lai gia tri SL
	if stack_sprite.stack1.is_empty():
		return
	var current1 = stack_sprite.stack1.pop()
	current1.count += 1
	re_new_var_count() #lam moi var SL
	var current2 = stack_sprite.stack2.pop()
	current2.visible = false
	var current3 = stack_sprite.stack3.pop()

func check_count(count_item):
	if count_item <= 0:
		_message()
		return false
	return true

func _message():
	$error_count.text = "Het nguyen lieu"
	$Timer.start(0.5)

func _on_timer_timeout():
	$error_count.text = ""

func reset_tick():
	$check_tick.visible = false
	$check_tick2.visible = false
	$check_tick3.visible = false
	$check_tick4.visible = false
	$check_tick5.visible = false
	$check_tick6.visible = false
	$check_tick7.visible = false
	$check_tick8.visible = false
	$check_tick9.visible = false
	$check_tick10.visible = false

func update_var_count():
	$Node.count = Singletons.bread_top
	$Node10.count = Singletons.bread_bottom
	$Node2.count = Singletons.ketchup
	$Node3.count = Singletons.butter
	$Node4.count = Singletons.tomato
	$Node5.count = Singletons.cucumber
	$Node6.count = Singletons.salad
	$Node7.count = Singletons.beef
	$Node8.count = Singletons.onion
	$Node9.count = Singletons.cheese

func re_new_var_count():
	Singletons.bread_top = $Node.count
	Singletons.bread_bottom = $Node10.count
	Singletons.ketchup = $Node2.count
	Singletons.butter = $Node3.count
	Singletons.tomato = $Node4.count
	Singletons.cucumber = $Node5.count
	Singletons.salad = $Node6.count
	Singletons.beef = $Node7.count
	Singletons.onion = $Node8.count
	Singletons.cheese = $Node9.count

