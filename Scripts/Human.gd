extends KinematicBody2D

signal happy_human;

onready var player = get_tree().root.get_child(0).get_node("PrimRose")

func _on_Area2D_body_entered(body):
	
	print(get_tree().root.name)
	print(player.has_object())
	
	if body.name == "PrimRose":
		if player.has_object():
			emit_signal("happy_human")
			player.remove_object()
