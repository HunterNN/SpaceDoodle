extends Node2D

@export var player:Node2D

var platform_set1

# Called when the node enters the scene tree for the first time.
func _ready():
	platform_set1 = load("res://scenes/platform_set1.tscn")
	add_child(platform_set1.instantiate())
	var child:Camera2D = player.get_child(2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(player.position.y)
	#if player.position.y:
	pass

