extends Area2D


const EPSILON = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var master_position = Vector2()

func _process(delta):
	if (position - master_position).length() > EPSILON:
		position = master_position

func set_master_position(position):
	master_position = position
