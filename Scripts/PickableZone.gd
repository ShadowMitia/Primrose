extends Area2D

func _on_Area2D_body_entered(body):
	#if (body.has_method("add_object")):
	
	if (body is PrimRose):
		var obj = get_parent()
		obj.hide()
		var old_parent = obj.get_parent()
		old_parent.remove_child(obj)
		body.add_child(obj)
		obj.position = Vector2(0.0, 0.0)
