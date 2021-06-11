extends Control

signal show_menu



func _on_Back_pressed():
	emit_signal("show_menu")
	set_visible(false)
