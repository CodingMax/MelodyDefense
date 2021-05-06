extends Node2D

var Enemy= preload("res://enemy.tscn") 
var timer
var initialPos
var spawnTimes = [1, 1, 3, 4, 1, 2]
var enemyNumber 
var spawnTime
var spawnEnd = spawnTimes.size()
var height = 1
var count = 0
var size = OS.window_size
func _ready():
	initialPos = self.global_position
	timer = 0
	enemyNumber = 0
	

func spawnEnemy():
	for i in height:
		i += 1
		var newEnemy = Enemy.instance()
		add_child(newEnemy)
		newEnemy.global_position = Vector2(-25, size.y - i*100)
		newEnemy.add_to_group("enemys")

func _process(delta):
	timer += delta
	if enemyNumber == spawnEnd:
		enemyNumber = 0
	spawnTime = spawnTimes[enemyNumber]
	if timer > spawnTime:
		print(enemyNumber)
		spawnEnemy()
		timer = 0
		enemyNumber += 1
		count += 1
	if count >5:
		height += 1
		count = 0
