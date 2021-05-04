extends StaticBody2D

var Bullet= preload("res://Bullet.tscn") 
var initialPos
var sound
var number = 0
var sounds = [load("res://Assets/Sounds/Amaj1.ogg"), load("res://Assets/Sounds/Amaj2.ogg"), load("res://Assets/Sounds/Amaj3.ogg"), load("res://Assets/Sounds/Amaj4.ogg"), load("res://Assets/Sounds/Amaj5.ogg")]
var key
var positions = [Vector2(0,5), Vector2(200,550), Vector2(300,400), Vector2(750,300)]

func loadSound(a):
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = sounds[a]
	sound = player
	
func _ready():
	initialPos = self.global_position 
	initialize(number)
	
func initialize(number):
	self.global_position = positions[number]
	key = number_to_key(number)
	loadSound(number)
	
func number_to_key(number):
	match number:
		1: return "a"
		2: return "s"
		3: return "d"
		4: return "f"
		5: return "g"
		_: return "a"
		
func shoot():
	var b = Bullet.instance()
	add_child(b)
	#b.global_position = initialPos 	#- Vector2(5,0)
	sound.play()

func _process(delta):
	if Input.is_action_just_pressed(key):
		shoot()
		
