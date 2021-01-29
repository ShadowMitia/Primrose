extends Area2D

func _on_Area2D_body_entered(body):
	#if (body.has_method("add_object")):
	if (body.name == "PrimRose"):
		body.add_object()
		get_parent().queue_free()
