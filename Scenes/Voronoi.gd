extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _draw():
#	var points = PoolVector2Array()
#
#	var size1 = get_rect().size / 2
#	var size2 = size1
#	size2.y *= -1;
#
#	var p1 = get_position() - size1
#	var p2 = get_position() + size1
#	var p3 = get_position() - size2
#	var p4 = get_position() + size2
#
#
#	points.append_array([p1, p2, p3, p4])
#	for child in get_parent().get_children():
#		if child is Node2D:
#			points.append(child.get_position())
#
#	var poolintarray = Geometry.triangulate_delaunay_2d(points)
#
#	for i in range(0, len(points), 3):
#		if i+1 >= len(points) or i+2 >= len(points):
#			break
#		draw_polygon([points[i], points[i+1], points[i+2]], [Color.white, Color.red, Color.blue])
