extends Area2D

export (float) var rotation_speed = 2

export (int) var value = 2
export (int) var category = 1

func _process(delta):
	rotate(rotation_speed * delta)
