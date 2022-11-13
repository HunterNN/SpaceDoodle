extends Node2D
var player:Player
var sprite
const rotation_speed = PI/512
const gravitation_force = 20.0
var is_attracting = true
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_children()[0]
	player = get_node("/root/Game/Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.rotate(rotation_speed)
	var distance = player.position.distance_to(position)
	if distance < 800:
		var direction = (position - player.position).normalized()
		if is_attracting:
			player.velocity += direction * gravitation_force
		else:
			player.velocity -= direction * gravitation_force
