extends Area2D

func _on_Area2D_body_entered(body):
	#if (body.has_method("add_object")):
	
	if (body is PrimRose):	
		var old_parent = get_parent().get_parent()
		old_parent.remove_child(get_parent())
		body.add_child(get_parent())
