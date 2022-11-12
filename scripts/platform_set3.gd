extends Node2D
var time = 0
var platforms
const radius = 600
const platform_height = -700
# Called when the node enters the scene tree for the first time.
func _ready():
	platforms = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	var counter = PI/4
	var sign = 1
	for platform in platforms:
		sign *= -1
		counter += PI/4
		platform.position.x =  cos(sign * time + counter) * radius
		platform.position.y =  sin(sign * time + counter) * radius + platform_height
