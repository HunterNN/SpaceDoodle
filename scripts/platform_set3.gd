extends Node2D
var time = 0
var platforms
const radius = 600
const platform_height = -700
# Called when the node enters the scene tree for the first time.
func _ready():
	platforms = get_children()
	platforms = platforms.filter(platform_filter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	var counter = PI/8
	var sign = 1
	for platform in platforms:
		sign *= -1
		counter += PI/8
		var new_x = cos(sign * time + counter) * radius
		var new_y = sin(sign * time + counter) * radius + platform_height
		var pause = new_y > platform.position.y
		platform.set_physics_process(!pause)
		platform.visible = !pause
		platform.position.x = new_x
		platform.position.y = new_y
		
func platform_filter(node):
	return "Platform" in node.name
