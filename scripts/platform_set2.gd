extends Node2D
var time = 0
var platforms
const elevator_height = -640
# Called when the node enters the scene tree for the first time.
func _ready():
	platforms = get_children()
	platforms = platforms.filter(filter_by_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * 2
	var counter = PI
	for platform in platforms:
		counter += PI
	#	platform.position.x = tan(time * PI / 2) * 300
		platform.position.y = sin(time + counter) * 300 + elevator_height

func filter_by_position(a):
	if a.position.y == -640:
		return true
	return false
