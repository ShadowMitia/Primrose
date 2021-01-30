extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var my_script = preload("res://Scripts/circle.gd")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	for child in get_children():
#		print(child.is_happy)
		if child.is_happy:
			var remote = RemoteTransform2D.new();
			child.add_child(remote)

			var remote_node = Node2D.new()
			remote_node.set_script(my_script)
			get_tree().root.get_child(0).get_node("Mask").get_node("Viewport").add_child(remote_node)
			
			remote.remote_path = remote_node.get_path()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
