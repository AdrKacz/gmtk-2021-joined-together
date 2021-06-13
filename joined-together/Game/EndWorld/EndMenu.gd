extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Session.stop_timer()
	var time = Session.time
	var minutes = floor(time / 60)
	var seconds = time % 60
	$CenterContainer/VBoxContainer2/HBoxContainer/Values/Time.text = "%02d:%02d" % [minutes, seconds]
	
	var categories_count = Session.categories_count
	$CenterContainer/VBoxContainer2/HBoxContainer/Values/Yellow.text = str(categories_count[0])
	$CenterContainer/VBoxContainer2/HBoxContainer/Values/Green.text = str(categories_count[1])
	$CenterContainer/VBoxContainer2/HBoxContainer/Values/Red.text = str(categories_count[2])
	
func _on_Play_pressed():
	Session.restart_game()
