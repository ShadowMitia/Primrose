extends Sprite
class_name PickableObject

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func object_hide():
	visible = false
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	
func object_show():
	visible = true
	$Area2D/CollisionShape2D.set_deferred("disabled", false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
