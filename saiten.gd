extends AnimatedSprite

var size = OS.window_size

var Enemy= preload("res://enemy.tscn")
var EnemyRed= preload("res://enemyRed.tscn")
var id
#var number = 1
var key

var score

var timer = 0.0
var variable
var timer2 = 0.0
var enemyNumber
var spawnTime
var 	spawnTimes = [1, 4, 6, 10, 15, 12]
var spawnEnd
var newEnemy
#var activated
var sound
var player



func _ready():
	id = int(self.name.replace("Saite", "")) 
	print(id)
	loadSound()
	spawnEnd = spawnTimes.size()
	initialize(id)

func initialize(num):
	key = number_to_key(num)
	timer = 0
	enemyNumber = 0

func _process(delta):
	if self.animation == "swinging":
		if self.is_playing():
			timer2 += delta
			if timer2 > 0.3:
				#print("Stop")
				#self.frame = 0
				#self.stop()
				self.play("idle")
				self.stop()
				timer2 = 0
	if Input.is_action_just_pressed(key):
		shoot()
	enemyClock(delta)

func shoot():
	if self.is_playing():
		self.stop()
		self.animation = "idle"
	else: self.play("swinging")
	player.play()
	if get_child_count() >= 0:
		#print(get_child_count())
		for child in get_children():
			if child.is_in_group("enemys") :
				get_node("../../Score").score += 1
				child.queue_free()
	#Shakedown

func enemyClock(delta):
	timer += delta
	if enemyNumber == spawnEnd:
		enemyNumber = 0
	spawnTime = spawnTimes[enemyNumber]*id
	if timer > spawnTime:
		#print(enemyNumber)
		spawnEnemy()
		timer = 0
		enemyNumber += 1

func spawnEnemy():
		match enemyNumber:
			1: 
				newEnemy = EnemyRed.instance()
			_: 
				newEnemy = Enemy.instance()
		add_child(newEnemy)
		#print(id)
		newEnemy.global_position = Vector2(self.global_position.x, 25)
		newEnemy.scale.x = 0.5
		newEnemy.scale.y = 0.327
		newEnemy.add_to_group("enemys")




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

func loadSound():
	player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = load("res://Assets/Sounds/Piano.ogg")
	player.volume_db = -20
	player.pitch_scale =  id*(0.08333333) + 0.5
	#print("Sound loaded")


