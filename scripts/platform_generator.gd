extends Node2D

@export var player:Node2D
var platform
# Called when the node enters the scene tree for the first time.
func _ready():
	platform = load("res://scenes/platform.tscn")
	var sprite = platform.instantiate()
	add_child(sprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_timeout():
	var sprite = platform.instantiate()
	add_child(sprite)
	sprite.global_position = player.global_position
	sprite.global_position.y += 120
