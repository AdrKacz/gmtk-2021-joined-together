extends Area2D


export (PackedScene) var next_world


func _on_Door_entered(area):
	print("Change Level")
