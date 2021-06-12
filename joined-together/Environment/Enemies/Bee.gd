extends Node2D

export (float) var speed = 30

onready var path = $Path2D/PathFollow2D
onready var enemy = $EnemyCollider

var is_flying_to_the_left = true

func _process(delta):
	path.offset += delta * speed
	if is_flying_to_the_left and path.position.x >= position.x:
		is_flying_to_the_left = false
		$AnimatedSprite.flip_h = true
	elif not is_flying_to_the_left and path.position.x <= position.x:
		is_flying_to_the_left = true
		$AnimatedSprite.flip_h = false
	
	enemy.position = path.position
