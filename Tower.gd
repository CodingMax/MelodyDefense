extends Area2D

var Bullet= preload("res://Bullet.tscn") 
var initialPos
var sound
var number = 1
var key
var size = OS.window_size
var score
#var positions = [Vector2(number*100, size.y-number*35), Vector2(200,500), Vector2(600,100), Vector2(500,200), Vector2(400,300), Vector2(300,400),  Vector2(600, 0)]

var sounds = ["res://Assets/Sounds/Amaj2.wav", "res://Assets/Sounds/Amaj7.ogg", "res://Assets/Sounds/Amaj3.ogg", "res://Assets/Sounds/Amaj4.ogg", "res://Assets/Sounds/Amaj5.ogg"]

func loadSound(a):
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = load(sounds[1])
	sound = player
	#var pitch = AudioEffectPitchShift
	#pitch.set_pitch_scale(a)
	sound.pitch_scale =  a*0.1 + 0.3
func initialize(num):
	#num += 1
	self.global_position = Vector2(num*200, size.y - num*100)#positions[number]
	key = number_to_key(num)
	loadSound(num)
	
func _ready():
	initialPos = self.global_position 
	#initialize(number)
	
	
func number_to_key(n):
	match n:
		1: return "a"
		2: return "s"
		3: return "d"
		4: return "f"
		5: return "g"
		6: return "h"
		7: return "j"
		8: return "k"
		9: return "l"
		10: return "i"
		11: return "o"
		12: return "p"
		_: return "a"
		
func shoot():
	var b = Bullet.instance()
	add_child(b)
	#b.global_position = initialPos 	#- Vector2(5,0)
	sound.play()
func gameOver():
	print("GameOver")
	get_node("../GameOver").visible = true
func _process(delta):
	if Input.is_action_just_pressed(key):
		shoot()
		


func _on_Tower_body_entered(body):
	if body.is_in_group("enemys"):
		body.queue_free()
		score = get_node("../Score").score
		if score >= 20:
			get_node("../Score").score -= 20
			print("Treffer!")
		else: gameOver()
