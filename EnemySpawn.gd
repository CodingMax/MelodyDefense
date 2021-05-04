extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Enemy= preload("res://enemy.tscn") 
var timer
var initialPos
# Called when the node enters the scene tree for the first time.
func _ready():
	initialPos = self.global_position
	timer = 0
	pass # Replace with function body.

func spawnWave():
	var newEnemy = Enemy.instance()
	add_child(newEnemy)
	newEnemy.global_position  = initialPos
	newEnemy.add_to_group("enemys")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer > 1:
		print("Enemy")
		spawnWave()
		timer = 0
