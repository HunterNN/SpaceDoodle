extends Area2D
@export var player:Node2D
const DEATH_DISTANCE = 0
var player_max_height = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.y = player_max_height + DEATH_DISTANCE
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.global_position.y < player_max_height:
		player_max_height = player.global_position.y
		global_position.y = player_max_height + DEATH_DISTANCE

func _on_body_entered(body):
	if "Player" in body.name:
		get_tree().quit()
