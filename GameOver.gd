extends PopupMenu


func _ready():
	add_check_item("Restart")
	add_check_item("Quit")
	set_item_as_checkable(1, true)
func _process(delta):
	if is_item_checked(1):
		print("Test")
