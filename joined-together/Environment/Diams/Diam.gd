extends Area2D

export (float) var rotation_speed = 2

export (int) var value = 2
export (int) var category = 1
export (PackedScene) var Particule

func _process(delta):
	rotate(rotation_speed * delta)

func _exit_tree():
	var explosion = null
	explosion = Particule.instance()
	explosion.position = self.position
	get_tree().current_scene.add_child(explosion)
	print("lol", explosion.position.x, self.position.x)
