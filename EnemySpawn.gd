extends Node2D

var Enemy= preload("res://enemy.tscn") 
var timer
var initialPos
var spawnTimes = [1, 1, 3, 4, 1, 2]
var enemyNumber 
var spawnTime
var spawnEnd = spawnTimes.size()
func _ready():
	initialPos = self.global_position
	timer = 0
	enemyNumber = 0
	

func spawnWave():
	var newEnemy = Enemy.instance()
	add_child(newEnemy)
	newEnemy.global_position  = initialPos
	newEnemy.add_to_group("enemys")

func _process(delta):
	timer += delta
	if enemyNumber == spawnEnd:
		enemyNumber = 0
	spawnTime = spawnTimes[enemyNumber]
	if timer > spawnTime:
		print(enemyNumber)
		spawnWave()
		timer = 0
		enemyNumber += 1
		
