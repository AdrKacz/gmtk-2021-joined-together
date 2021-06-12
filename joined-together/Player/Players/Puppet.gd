extends Area2D


const EPSILON = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var master_position = Vector2()
var collision_count = 0

func _process(delta):
	if (position - master_position).length() > EPSILON:
		position = master_position

func set_master_position(position):
	master_position = position


func _on_Puppet_body_entered(body):
	collision_count += 1


func _on_Puppet_body_exited(body):
	collision_count -= 1
	if collision_count < 0:
		 collision_count = 0
		
func is_collided():
	return collision_count > 0
