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
	emit_signal("start_game")
	get_parent_control().set_visible(false)
	pass # Replace with function body.


func _on_Options_pressed():
	print("options")
	emit_signal("show_options")
	set_visible(false)
	pass # Replace with function body.
