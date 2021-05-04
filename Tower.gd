extends StaticBody2D

var Bullet= preload("res://Bullet.tscn") 
var initialPos
var sound

func loadSound():
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = load("res://Assets/Sounds/Amaj1.ogg")
	sound = player
	
func _ready():
	initialPos = self.global_position 
	loadSound()
	
func shoot():
	var b = Bullet.instance()
	add_child(b)
	b.global_position = initialPos 	#- Vector2(5,0)
	sound.play()

func _process(delta):
	if Input.is_action_just_pressed("a"):
		shoot()
		
