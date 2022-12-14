extends Node2D
var time = 0
var move_range = 300
var platforms
# Called when the node enters the scene tree for the first time.
func _ready():
	platforms = get_children()
	platforms.sort_custom(sort_by_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * 2
	var counter = PI/8
	var sign = 1
	for platform in platforms:
		counter += PI/8
		sign *= -1
		platform.position.x =  sign * tan(time + counter) * 300



func sort_by_position(a, b):
	if a.position.y < b.position.y:
		return true
	return false

