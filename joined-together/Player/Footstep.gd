extends Node


onready var audios = $Audios

var is_playing = false

func toggle_audio(toggle):
	if toggle == is_playing:
		return

	if toggle:
		audios.get_child(randi() % audios.get_child_count()).play()
		$Timer.start()	
	else:
		$Timer.stop()
	is_playing = toggle

func _on_Timer_timeout():
	audios.get_child(randi() % audios.get_child_count()).play()
