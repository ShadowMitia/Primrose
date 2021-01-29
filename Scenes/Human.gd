extends KinematicBody2D

onready var player = get_tree().root.get_child(0).get_node("PrimRose")

func _on_Area2D_body_entered(body):
	
	print(get_tree().root.name)
	print(player.has_object())
	
	if body.name == "PrimRose":
		if player.has_object():
			player.remove_object()
