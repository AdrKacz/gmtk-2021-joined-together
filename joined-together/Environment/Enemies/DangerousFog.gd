extends Area2D


export var speed = 3.0

func _physics_process(delta):
	position.x += speed * delta
