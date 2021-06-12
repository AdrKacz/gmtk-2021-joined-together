extends Node


onready var master_player = $Master
onready var puppet_player = $Puppet
onready var symmetry_center = $SymmetryCenter

var x_symmetry_position

func _process(delta):
#	set symmetry
	symmetry_center.position.x = master_player.position.x
	
#	move puppet
	var master_position = master_player.position
	master_position.y += 2 * (symmetry_center.position.y - master_position.y)
	
	puppet_player.set_master_position(master_position)

func get_x():
	return symmetry_center.position.x
	
func set_y(y):
	symmetry_center.position.y = y
