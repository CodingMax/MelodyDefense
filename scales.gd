extends Control


export (NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)



var octave 
var scales = {"major" : [2,2,1,2,2,2,1]}
var rootNotes = {"c" : 1, "c#" : 2, "d" : 3, "d#" : 4, "e" : 5, "f" : 6, "f#": 7, "g" : 8, "g#" : 9, "a" : 10, "a#" : 11, "h" : 12}
var rootNotes2 = ["0", "c", "c#", "d", "d#", "e", "f", "f#" , "g", "g#", "a", "a#", "h"]
var saiten 
var notesInScale = []
var selectedRoot
var selectedScale

func add_items():
	for i in 12:
		dropdown.add_item(rootNotes2[i])


func _ready():
	saiten = get_tree().get_nodes_in_group("Saiten")
	add_items()
	selectedRoot = "g"
	selectedScale = "major"
	setScale()




func _on_ScalePicker_item_selected(index):
	selectedRoot = rootNotes2[index]
	setScale()
	
func setScale():
	notesInScale.clear()
	generateScale(selectedRoot, selectedScale)
	swapStrings()
	
func generateScale(rootNote, scale):
#	var newRoot = rootNotes[rootNote]
	var newScale = scales[scale] #Swappingg Scalename with Array
	var newRoot = rootNotes[rootNote] # getting Root as Number
	var currentString = newRoot #setting root string number
	for i in newScale:
		notesInScale.append(currentString)
		if currentString + i > 12:
			currentString += i - 12
		else: currentString += i
	
	#for i in newScale.size():
	#	notesInScale.append(newScale[i] + newRoot)
	notesInScale.append(currentString)
	#notesInScale += newScale
	print("Noten in der Skala" + str(notesInScale))


func swapStrings():
	for saite in saiten:
		if notesInScale.has(saite.id):
			saite.set_process(true)
			saite.show()
			print("aktive saite"+ str(saite.id))
		else:
			 saite.set_process(false)
			 saite.hide()

