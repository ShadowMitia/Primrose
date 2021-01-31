extends KinematicBody2D
class_name PrimRose

export(float) var SPEED = 200

func _process(delta):
	for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name.substr(0, 9) == "Dead Tree":
				collision.collider.set_velocity(-collision.normal)

			
func _physics_process(delta):
	
	var velocity = Vector2.ZERO;
	
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left");
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up");	
	velocity = velocity.normalized()
	velocity *= SPEED
	
	if velocity.length() > 0:
		get_tree().root.get_child(0).get_node("Humans").update_nodes()
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	if abs(velocity.x) > abs(velocity.y):
		if velocity.x > 0:
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("walk_sideways")
		else:
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("walk_sideways")
	else:
		if velocity.y < 0:
			$AnimatedSprite.play("walk_up")
		else:
			$AnimatedSprite.play("walk_down")
	
	velocity = move_and_slide(velocity, Vector2.ZERO)

func _on_Timer_timeout():
	get_node("../EndScreen").show_credits()
