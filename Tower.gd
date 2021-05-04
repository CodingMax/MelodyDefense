extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#export (PackedScene) var Bullet
var Bullet= preload("res://Bullet.tscn") 

func shoot():
	var b = Bullet.instance()
	add_child(b)
	b.position = self.position - Vector2(5,0)
	print("Shot")
# Called when the node enters the scene tree for the first time.
#func _ready():
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("a"):
		shoot()
		
