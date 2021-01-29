extends TileMap

onready var timer:Timer = Timer.new();
onready var tween:Tween = Tween.new();

onready var is_happy:bool = false

onready var x:float = 0
onready var done:bool = false

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
	

func update_variation():
	var duration = 2 # in seconds
#	
	tween.interpolate_property(get_material().shader, "shader_param:activation",
	0.0, 1.0, duration,
	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	tween.set_active(true)

func _on_Human_happy_human():	
	# bool interpolate_property(object: Object, property: NodePath, initial_val: Variant, final_val: Variant, duration: float, trans_type: TransitionType = 0, ease_type: EaseType = 2, delay: float = 0)
	# update_variation()
	is_happy = true
#	var duration = 2
	
#	tween.interpolate_property(get_material(), "shader_param:activation",
#	0.0, 1.0, duration,
#	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#
#	tween.start()
