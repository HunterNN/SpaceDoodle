extends Node2D

@export var player:Node2D

var platform_set1
var height = 1600;
var lowest_y = 0
var active_sets = []
var repeat_texture:Texture ;
# Called when the node enters the scene tree for the first time.
func _ready():
	platform_set1 = load("res://scenes/platform_set1.tscn")
	repeat_texture= load("res://assets/images/repeat.png")
	var new_set = platform_set1.instantiate()
	active_sets.append(new_set)
	add_child(new_set)
	var child:Camera2D = player.get_child(2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.y < lowest_y:
		lowest_y -= height
		var new_set = platform_set1.instantiate()
		active_sets.append(new_set)
		add_child(new_set)
		new_set.position.y = lowest_y

		var sprite = Sprite2D.new()
		sprite.set_texture(repeat_texture)
		sprite.position.y = lowest_y
		sprite.scale= Vector2(1,1.6)
		add_child(sprite)
		
