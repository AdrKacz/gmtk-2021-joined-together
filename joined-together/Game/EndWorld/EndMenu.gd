extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Session.stop_timer()
	var time = Session.time
	var minutes = floor(time / 60)
	var seconds = time % 60
	$CenterContainer/VBoxContainer/Time/Time.text = "%02d:%02d" % [minutes, seconds]
	$CenterContainer/VBoxContainer/Score/Score.text = str(Session.value)
	
func _on_Play_pressed():
	Session.restart_game()
