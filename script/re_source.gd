extends Node

var save_path = "user://variable.save"

var bread
var bread_top
var ketchup
var butter
var tomato 
var onion 
var cucumber 
var salad
var cheese
var beef 
var bread_bottom 
var coin

var data = {
	"Banh mi" : bread,
	"Banh mi _ top" : bread_top,
	"Banh mi _ bottom" : bread_bottom,
	"Tuong ca" :ketchup,
	"Bo" : butter,
	"Ca chua" : tomato,
	"Hanh tay" : onion,
	"Dua leo" : cucumber,
	"Sa lad" : salad,
	"Pho mai" :cheese,
	"Thit bo" : beef,
	"Tien" : coin
}

var hashed_data = {}

func _process(delta):
	data["Banh mi"] = Singletons.bread
	data["Banh mi _ top"] = Singletons.bread_top
	data["Banh mi _ bottom"] = Singletons.bread_bottom
	data["Tuong ca"] = Singletons.ketchup
	data["Bo"] = Singletons.butter
	data["Ca chua"] = Singletons.tomato
	data["Hanh tay"] = Singletons.onion
	data["Dua leo"] = Singletons.cucumber
	data["Sa lad"] = Singletons.salad
	data["Pho mai"] = Singletons.cheese
	data["Thit bo"] = Singletons.beef
	data["Tien"] = Singletons.coin

func hashing_data():
	for key in data.keys():
		var hashed_key = hash(key)
		hashed_data[hashed_key] = data[key]

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	for key in hashed_data.keys():
		var line = str(key) + ":" + str(hashed_data[key])
		file.store_line(line)
	file.close()


func load():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		while not file.eof_reached():
			var line = file.get_line()
			var array = line.split(":")
			hashed_data[array[0]] = array[-1].to_int()
		Singletons.bread = hashed_data[str(hash("Banh mi"))]
		Singletons.bread_top = hashed_data[str(hash("Banh mi _ top"))]
		Singletons.bread_bottom = hashed_data[str(hash("Banh mi _ bottom"))]
		Singletons.ketchup = hashed_data[str(hash("Tuong ca"))]
		Singletons.butter = hashed_data[str(hash("Bo"))]
		Singletons.tomato = hashed_data[str(hash("Ca chua"))]
		Singletons.onion = hashed_data[str(hash("Hanh tay"))]
		Singletons.cucumber = hashed_data[str(hash("Dua leo"))]
		Singletons.salad = hashed_data[str(hash("Sa lad"))]
		Singletons.cheese = hashed_data[str(hash("Pho mai"))]
		Singletons.beef = hashed_data[str(hash("Thit bo"))]
		Singletons.coin = hashed_data[str(hash("Tien"))]
	else:
		print("No File Save")
