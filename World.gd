extends WorldEnvironment

var size = OS.window_size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Tower= preload("res://Tower.tscn") 
var level = 4;
# Called when the node enters the scene tree for the first time.
func loadTowers():
	for number in level:
		var newTower = Tower.instance()
		add_child(newTower)
		newTower.number = number
		newTower.initialize(number)
		#newTower.global_position = newTower.positions[number]
	
func _ready():
	print(size)
	loadTowers()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
