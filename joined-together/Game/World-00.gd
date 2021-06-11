extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI.set_visible(true)
	$Game.set_visible(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Menu_start_game():
	$UI.visible = false
	$Game.visible = true
	print("starting")
	pass # Replace with function body.


func _on_Options_show_menu():
	$UI/Options.visible = false
	$UI/Menu.visible = true
	print("go to menu")
	pass # Replace with function body.


func _on_Menu_show_options():
	$UI/Options.visible = true
	$UI/Menu.visible = false
	print("go to options")
	pass # Replace with function body.


func _on_Menu_pressed():
	$UI.visible = true
	$Game.visible = false
	pass # Replace with function body.
