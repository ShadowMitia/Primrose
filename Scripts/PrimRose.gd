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
	
	velocity = move_and_slide(velocity, Vector2.ZERO)


