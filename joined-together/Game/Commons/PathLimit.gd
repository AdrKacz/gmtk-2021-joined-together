extends Area2D

signal shape_exit(id)

var idx

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_PathLimit_area_exited(area):
	emit_signal("shape_exit", idx)
