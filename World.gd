extends WorldEnvironment

var size = OS.window_size


var enemys

func _ready():
	print(size)
	#loadTowers()


func gameOver():
	print("GameOver")
	#get_node("../GameOver").visible = true


func _on_GameOver_hide():
	pass # Replace with function body.

func restartGame():
	get_node("GameOver").hide()
	get_node("Instructions").visible = true
	get_node("Score").score = 0
	enemys = get_tree().get_nodes_in_group("enemys")
	for i in enemys:
		i.queue_free()
func _on_GameOver_gui_input(event):
	restartGame()


func _on_Collision_body_entered(body):
	if body.is_in_group("enemys"):
		body.queue_free()
		if $Score.score >= 20:
			get_node("Score").score -= 20
			print("Treffer!")
		else: gameOver()
	pass # Replace with function body.


