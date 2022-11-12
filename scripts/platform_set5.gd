extends Node2D
var set1
var set2
var time = 0
var active_set = 1
var duration = 3.0
# Called when the node enters the scene tree for the first time.
func _ready():
	set1 = get_node("Set1")
	set2 = get_node("Set2")
	remove_child(set2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > duration:
		time = 0
		if active_set == 1:
			active_set = 2
			remove_child(set1)
			add_child(set2)
		elif active_set == 2:
			active_set = 1
			remove_child(set2)
			add_child(set1)
	pass
