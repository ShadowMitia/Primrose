extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var color = Color.black
var radius = 300.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	draw_circle(Vector2.ZERO, radius, color)
