extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Session.connect("update_categories", self, "update_categories")
	Session.connect("update_time", self, "update_time")
	update_categories(Session.categories_count)
	update_time(Session.time)

func update_categories(categories_count):
	$Diams/HBoxContainer/YellowDiam/Count.text = str(categories_count[0])
	$Diams/HBoxContainer/GreenDiam/Count.text = str(categories_count[1])
	$Diams/HBoxContainer/RedDiam/Count.text = str(categories_count[2])

func update_time(time):
	var minutes = floor(time / 60)
	var seconds = time % 60
	$Time/Label.text = "%02d:%02d" % [minutes, seconds]
