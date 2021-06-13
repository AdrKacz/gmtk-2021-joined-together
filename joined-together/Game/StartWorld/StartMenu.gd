extends Control

func _on_Start_pressed():
	Session.start()

func _on_Options_pressed():
	Session.options_with_opacity()
