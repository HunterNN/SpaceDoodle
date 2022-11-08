extends Camera2D
var player:Node2D

const CAMERA_OFFSET = 600
var max_height = 800
# Called when the node enters the scene tree for the first time.
func _ready():
	set_limit(SIDE_LEFT,-800)
	set_limit(SIDE_RIGHT,800)
	set_limit(SIDE_BOTTOM,max_height)
	player = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if max_height > player.position.y + CAMERA_OFFSET:
		max_height = player.position.y + CAMERA_OFFSET
		set_limit(SIDE_BOTTOM,max_height)
