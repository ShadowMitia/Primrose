extends KinematicBody2D

signal happy_human;

onready var player = get_tree().root.get_child(0).get_node("PrimRose")

onready var is_happy:bool = false
onready var x:float = 0
onready var done:bool = false

func _on_Area2D_body_entered(body):
	
	print(get_tree().root.name)
	print(player.has_object())
	
	if body.name == "PrimRose":
		if player.has_object():
			emit_signal("happy_human")
			player.remove_object()



func _process(delta):
	
	if done:
		return
		
	if is_happy:
		x += delta
		var val =  1 - cos((x * PI) / 2)
		print(val)
		get_material().set("shader_param/activation", val);
		if x > 1.0:
			done = true

func _on_Human_happy_human():	
	# bool interpolate_property(object: Object, property: NodePath, initial_val: Variant, final_val: Variant, duration: float, trans_type: TransitionType = 0, ease_type: EaseType = 2, delay: float = 0)
	# update_variation()
	is_happy = true
