extends KinematicBody2D
var initialPos 
var speed
var type = "red"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	match type:
		"red": 
			speed = 80
		_:
			speed = 50


func _physics_process(delta):
	position += transform.x * speed * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
