extends CharacterBody2D


enum {
	IDLE,
	MOVE_Ox,
	MOVE_Oy,
}

const SPEED = 20.0
const speed = 60.0

@export var id_burger = 1

@onready var animation = $AnimatedSprite2D
@onready var audio_player = $AudioStreamPlayer2D

var random_number = randi()% 4
var distance = 30
var move = 0
var direction = 1
var current_state =IDLE
var can_auto_move = true
var clicked_mouse = false
var target = Vector2(globalsignal.get_start_x(),226)

var start_re_spawner = false
var target_re_spawner

func _ready():
	randomize()

func _process(delta):
	if queue_sprite.queue1.is_empty():
		globalsignal.reset_start_x()
		Singletons.first_time_img = true
		Singletons.thuc_don_tmp2 = Singletons.thuc_don_tmp.duplicate(true)
		Singletons.thuc_don_tmp2.shuffle()

func _physics_process(delta):
	if can_auto_move:
		match current_state:
			IDLE:
				animation.play("idle")
			MOVE_Ox:
				move_ox(delta)
			MOVE_Oy:
				move_oy(delta)
	if clicked_mouse:
		animation.flip_h = false
		animation.play("runOx")
		move_to_target(target)
		check_in_target(target)
	if start_re_spawner:
		$CollisionShape2D.disabled = true
		if target_re_spawner.x > 140:
			animation.flip_h = true
		else:
			animation.flip_h = false
		animation.play("runOx")
		if Singletons.bool_emotes == 1:
			$emotes.play("like")
		elif Singletons.bool_emotes == 2:
			$emotes.play("dislike")
		move_to_target_re_spawner(target_re_spawner)
		can_auto_move = false
		check_in_target_re_spawner(target_re_spawner)

func move_ox(delta): #Di chuyen trai phai
	velocity.x = direction * SPEED
	move += delta * SPEED
	if move >= distance:
		direction = - direction
		move = 0
	animation.flip_h = direction > 0
	animation.play("runOx")
	move_and_slide() 

func move_oy(delta): #Di chuyen len xuong
	velocity.y = direction * SPEED
	move += delta * SPEED
	if move >= distance:
		direction = - direction
		move = 0
	if direction < 0:
		animation.play("runOy1")
	else:
		animation.play("runOy2")
	move_and_slide()
 
func choose(array):
	randomize()
	array.shuffle()
	return array.front()

func _on_timer_timeout():
	$Timer.wait_time = choose([0.75, 1, 1.25, 1.5, 1.75])
	current_state = choose([IDLE, MOVE_Ox, MOVE_Oy])

func update_animation(target):
	if not can_auto_move:
		var angle = position.angle_to(target)
		var degree = rad_to_deg(angle)
		if degree >= -45 and degree < 45:
			animation.play("runOx")
		elif degree >= 45 and degree < 135:
			animation.play("runOy2")
		elif degree >= 135 or degree < -135:
			animation.play("runOx")
		else:
			animation.play("runOy1")

func check_in_target_move(target):
	var dist = position.distance_to(target)
	if dist <= 10:
		animation.play("idle")
		clicked_mouse = false
		$thought_bubble.region_enabled = false

func move_to_target(target):
	velocity = position.direction_to(target) * speed
	if position.direction_to(target).x > 0:
		animation.flip_h = true
	if position.distance_to(target) > 10:
			move_and_slide()
	can_auto_move = false
	$CollisionShape2D.disabled = true
	$emotes.visible = true
	$emotes.play("chill")

func move_to_target_re_spawner(target):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
			move_and_slide()
	can_auto_move = false
	$CollisionShape2D.disabled = true
	$emotes.visible = true


func check_in_target(target):
	var dist = position.distance_to(target)
	if dist <= 10:
		if Singletons.first_time_img:
			var current = Singletons.thuc_don_queue.pop_front()
			Singletons.img_thuc_don = current.img
			Singletons.id_thuc_don = current.id
			Singletons.first_time_img = false
		animation.play("idle")
		clicked_mouse = false
		$emotes.visible = true
		$emotes.play("wait")
		
func check_in_target_re_spawner(target):
	var dist = position.distance_to(target)
	if dist <= 10:
		start_re_spawner = false
		clicked_mouse = false
		can_auto_move = true
		$CollisionShape2D.disabled = false
		$emotes.visible = false
		Singletons.bool_emotes = 0

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		globalsignal.increase_start_x()
		target = Vector2(globalsignal.get_start_x(), 226)
		clicked_mouse = true
		can_auto_move = false
		#queue_manager.enqueue_sprite(self)
		queue_sprite.queue1.enqueue(self)
		queue_sprite.count += 1
		#Singletons.thuc_don_tmp.shuffle()
		var current = Singletons.thuc_don_tmp2.pop_front()
		Singletons.thuc_don_queue.push_back(current)
		audio_player.play()

func re_spawner():
	print("Func re_spawner Worked")
	start_re_spawner = true
	can_auto_move = false
	clicked_mouse = false
	var resultOx = randi() % 551 + 50
	var resultOy = randi() % 201 + 330
	print("ox = ", resultOx)
	print("oy = ", resultOy)
	target_re_spawner = Vector2(resultOx,resultOy)

func piling_up_sprite():
	print("piling up")
	target = Vector2(target.x - 80, target.y)
	start_re_spawner = false
	can_auto_move = false
	clicked_mouse = true
