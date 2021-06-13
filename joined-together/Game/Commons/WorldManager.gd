extends Node

var PathLimit = preload("res://Game/Commons/PathLimit.tscn")


onready var player = $Player
onready var WorldPath = $WorldPath
onready var curve = $WorldPath.get_curve()

onready var top_shader = $Shaders/Top
onready var bottom_shader = $Shaders/Bottom

var previous_idx
var next_idx

var current_slope
var current_origin

# Called when the node enters the scene tree for the first time.
func _ready():
	create_path_limit()
	find_idxs()

func create_path_limit():
	for i in range(curve.get_point_count()):
		var path_limit = PathLimit.instance()
		path_limit.position = curve.get_point_position(i)
		path_limit.name = "Limit-" + str(i)
		path_limit.idx = i
		path_limit.connect("shape_exit", self, "update_idxs")
		WorldPath.add_child(path_limit)

func find_idxs():
#	The path have to outbound the world
#	The path cannot be S-shaped
	var player_x = player.get_x()
	var has_found_idx = false
	var idx = 0
	while (idx < curve.get_point_count() - 1 and not has_found_idx):
		var from_x = curve.get_point_position(idx).x
		var to_x = curve.get_point_position(idx + 1).x
		if from_x <= player_x and player_x < to_x:
			has_found_idx = true
		else:
			idx += 1
	
	previous_idx = idx
	next_idx = idx + 1
	calc_y_fct()
	
func update_idxs(idx):
#	Player should never pass through the last limit
	find_idxs()
	
func calc_y_fct():
	var previous_idx_position= curve.get_point_position(previous_idx)
	var next_idx_position = curve.get_point_position(next_idx)
	
	current_slope = (next_idx_position.y - previous_idx_position.y) / (next_idx_position.x - previous_idx_position.x)
	current_origin = previous_idx_position.y - current_slope * previous_idx_position.x
	
func get_y_from_idxs(x):
	return current_slope * x + current_origin
	
func _physics_process(delta):
	player.set_y(get_y_from_idxs(player.get_x()))


func _on_Player_has_switch(who):
	if who:
		top_shader.hide()
		bottom_shader.show()
	else:
		top_shader.show()
		bottom_shader.hide()
