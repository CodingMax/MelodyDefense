extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#export (PackedScene) var Bullet
var Bullet= preload("res://Bullet.tscn") 
var initialPos
var sound
func _ready():
	initialPos = self.global_position 
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = load("res://Assets/Sounds/Amaj1.ogg")
	sound = player
func shoot():
	var b = Bullet.instance()
	add_child(b)
	b.global_position = initialPos	#- Vector2(5,0)
	sound.play()
	print("Shot")
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("a"):
		shoot()
		
