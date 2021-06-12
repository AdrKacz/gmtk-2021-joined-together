extends Area2D


export (PackedScene) var next_world


func _on_Door_entered(area):
	if area.is_in_group("player"):
		Session.succeed_world()
		get_tree().change_scene_to(next_world)
