extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func check_end_game():
	var nodes = get_tree().get_nodes_in_group("Pickable")
	print("Nodes left", len(nodes))
	if len(nodes) == 1:
		print("Game is done!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
