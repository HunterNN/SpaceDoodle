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
	for platform in platforms:
		counter += PI/4
		platform.position.x = cos(time + counter) * radius
		platform.position.y = sin(time + counter) * radius + platform_height
