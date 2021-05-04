extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50
var initialPos

# Called when the node enters the scene tree for the first time.
func _ready():
	initialPos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	position -= transform.x * speed * delta

func _on_Bullet_body_entered(body):
#	if body.is_in_group("targets"):
#		body.queue_free()
#	queue_free()
	position = initialPos
	print("position")
