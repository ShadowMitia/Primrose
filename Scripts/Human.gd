tool
extends KinematicBody2D

signal happy_human;

onready var player = get_tree().root.get_child(0).get_node("PrimRose")

onready var is_happy:bool = false
onready var x:float = 0
onready var done:bool = false

export var texture:Texture setget set_tex;
export(String) var human_name;
export(NodePath) var lost_object_ref;
var lost_object;

func set_tex(tex):
	texture = tex
	if Engine.editor_hint:
		get_node("Sprite").texture = tex
		
func _ready():
	$Sprite.texture = texture
	lost_object = get_node(lost_object_ref)

func _on_Area2D_body_entered(body:PhysicsBody2D):
	if body is PrimRose:
		for child in body.get_children():
			if child is PickableObject && child == lost_object:
				emit_signal("happy_human")
				child.queue_free()

func _process(delta):
	if done:
		return
	if is_happy:
		x += delta
		var val =  1 - cos((x * PI) / 2)
		get_material().set("shader_param/activation", val);
		if x > 1.0:
			done = true

func _on_Human_happy_human(object):
	if object == lost_object:
		# bool interpolate_property(object: Object, property: NodePath, initial_val: Variant, final_val: Variant, duration: float, trans_type: TransitionType = 0, ease_type: EaseType = 2, delay: float = 0)
		# update_variation()
		is_happy = true
		object.queue_free()
