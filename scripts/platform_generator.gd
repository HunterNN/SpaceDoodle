extends Node2D

@export var player:Node2D
var height = 1600
var lowest_y = 0
var sets = []
var active_sets = []
var repeat_texture:Texture

var rng = RandomNumberGenerator.new()
 
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	repeat_texture = load("res://assets/images/repeat.png")
	sets.append(load("res://scenes/platform_set1.tscn"))
	sets.append(load("res://scenes/platform_set2.tscn"))
	sets.append(load("res://scenes/platform_set3.tscn"))
	sets.append(load("res://scenes/platform_set4.tscn"))
	sets.append(load("res://scenes/platform_set5.tscn"))
	#var new_set = sets[rng.randi_range(0, sets.size()-1)].instantiate()
	var new_set = sets[2].instantiate()
	active_sets.append(new_set)
	add_child(new_set)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var respawn = Input.is_key_pressed(KEY_R)
	if respawn:
		player.position.y = lowest_y
	if player.position.y < lowest_y:
		lowest_y -= height
		var new_set_index = rng.randi_range(0, sets.size()-1)
		var new_set = sets[new_set_index].instantiate()
		active_sets.append(new_set)
		add_child(new_set)
		new_set.position.y = lowest_y
		var sprite = Sprite2D.new()
		sprite.set_texture(repeat_texture)
		sprite.position.y = lowest_y
		sprite.scale = Vector2(1,1.6)
		add_child(sprite)
		
