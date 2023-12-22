extends Node

var start_re_spawner = false
var result : int = 0

var bread = 10
var bread_top = 10
var ketchup = 10 #tương cà
var butter = 10 #bơ
var tomato = 10 #cà chua
var onion = 10 #hành tây
var cucumber = 10 #dưa leo
var salad = 10
var cheese = 10
var beef = 10
var bread_bottom = 10
var coin = 1000

var first_time_img = true
var first_time_id = true

var img_thuc_don
var id_thuc_don

var thuc_don_1 = {img = preload("res://asset/thuc_don/197461.png"), id = 164791}
var thuc_don_2 = {img = preload("res://asset/thuc_don/1273461.png"), id = 1643721}
var thuc_don_3 = {img = preload("res://asset/thuc_don/1286371.png"), id = 1736821}
var thuc_don_4 = {img = preload("res://asset/thuc_don/12697561.png"), id = 16579621}
var thuc_don_5 = {img = preload("res://asset/thuc_don/126495731.png"), id = 137594621}

var thuc_don_tmp = [thuc_don_1, thuc_don_2, thuc_don_3, thuc_don_4, thuc_don_5]
var thuc_don_tmp2 = []
var thuc_don_queue = []

var bool_emotes = 0

func re_spawner() -> Vector2:
	start_re_spawner = true
	var resultOx = 16 + randi() % 640 - 16 + 1
	var resultOy = 303 + randi() % 550 - 303 + 1
	return Vector2(resultOx,resultOy)

func buy_bread() -> int:
	bread_top+=1
	bread_bottom+=1
	bread+=1
	coin -= 10
	return bread

func buy_ketchup() -> int:
	ketchup+=1
	coin -= 10
	return ketchup

func buy_butter() -> int:
	butter+=1
	coin -= 10
	return butter
	
func buy_tomato() -> int:
	tomato+=1
	coin -= 10
	return tomato
	
func buy_onion() -> int:
	onion+=1
	coin -= 10
	return onion
	
func buy_cucumber() -> int:
	cucumber+=1
	coin -= 10
	return cucumber
	
func buy_salad() -> int:
	salad+=1
	coin -= 10
	return salad
	
func buy_cheese() -> int:
	cheese+=1
	coin -= 10
	return cheese
	
func buy_beef() -> int:
	beef+=1
	coin -= 10
	return beef

func buy_burger(x) -> int:
	x += 1
	charged()
	return x

func add_coin():
	coin += 100

func charged():
	coin -= 20

func new_game():
	bread = 10
	bread_top = 10
	ketchup = 10 #tương cà
	butter = 10 #bơ
	tomato = 10 #cà chua
	onion = 10 #hành tây
	cucumber = 10 #dưa leo
	salad = 10
	cheese = 10
	beef = 10
	bread_bottom = 10
	coin = 1000
