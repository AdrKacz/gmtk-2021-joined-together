extends Control

signal start_game
signal show_options

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	print("play")
	get_tree().change_scene("res://Game/World-01.tscn")


func _on_Options_pressed():
	get_tree().change_scene("res://GUI/Options.tscn")
	pass # Replace with function body.
