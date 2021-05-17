extends Node2D

var Enemy= preload("res://enemy.tscn") 
var timer
var initialPos
var spawnTimes = [10, 10, 30, 40, 10, 20]
var enemyNumber 
var spawnTime
var spawnEnd = spawnTimes.size()
var height = 1
var count = 0
var size = OS.window_size
var saiten 
var id
func _ready():
	initialPos = self.global_position
	timer = 0
	enemyNumber = 0
	saiten = get_tree().get_nodes_in_group("Saiten")

func spawnEnemy():
	#for i in saiten:
		var newEnemy = Enemy.instance()
		add_child(newEnemy)
		newEnemy.global_position = Vector2(-25, self.global_position.y)
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
