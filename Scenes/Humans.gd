extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var white_circle_script = preload("res://Scripts/white_circle.gd")
onready var black_circle_script = preload("res://Scripts/black_circle.gd")

export(Texture) var texture;

func _ready():
	for child in get_children():
		child.lost_object.object_hide()

# Called when the node enters the scene tree for the first time.
func update_nodes():
	for child in get_children():
#		print(child.is_happy)
		if child.is_happy:
			var remote = RemoteTransform2D.new();
			child.add_child(remote)

			var remote_node = Node2D.new()
			remote_node.set_script(white_circle_script)
			get_tree().root.get_child(0).get_node("Mask").get_node("Viewport").add_child(remote_node)
			
			remote.remote_path = remote_node.get_path()
			
	for child in get_children():
		if !child.is_happy:
			var remote = RemoteTransform2D.new();
			child.add_child(remote)

			var remote_node = Node2D.new()
			remote_node.set_script(black_circle_script)
			get_tree().root.get_child(0).get_node("Mask").get_node("Viewport").add_child(remote_node)
			
			remote.remote_path = remote_node.get_path()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
