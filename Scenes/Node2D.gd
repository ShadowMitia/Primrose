tool
extends Node2D

export(float) var radius = 10.0;

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color.white)
