extends WorldEnvironment

var size = OS.window_size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var timer = 0
var EnemySpawn= preload("res://EnemySpawn.tscn") 
var Tower= preload("res://Tower.tscn") 
var level = 4
var saiten
var count
# Called when the node enters the scene tree for the first time.
func loadTowers():
	saiten = get_tree().get_nodes_in_group("Saiten")
	count = 0
	for i in saiten:
		count += 1
		var newEnemySpawn = EnemySpawn.instance()
		add_child(newEnemySpawn)
		newEnemySpawn.global_position = Vector2(-25, i.global_position.y)
		newEnemySpawn.id = count
		newEnemySpawn.add_to_group("enemySpawns")
#	for number in level:
		var newTower = Tower.instance()
		add_child(newTower)
		newTower.number = count
		newTower.initialize(count)
		newTower.global_position = Vector2(size.x-30, i.global_position.y)
		#newTower.global_position = newTower.positions[number]
	
func _ready():
	print(size)
	loadTowers()


# Called every frame. 'delta' is the elapsed time since the previous frame.

#func _process(delta):
	#timer += delta
	#if timer > 15:
	#	level += 1
