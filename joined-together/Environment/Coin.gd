extends Area2D


var rot_speed = 3



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta * rot_speed)
