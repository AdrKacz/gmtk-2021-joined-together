extends Node

export (PackedScene) var MasterPlayer = preload("res://Player/Players/Master.tscn")
export (PackedScene) var PupperPlayer = preload("res://Player/Players/Puppet.tscn")


var master_player
var puppet_player
onready var symmetry_center = $SymmetryCenter
onready var camera = $SymmetryCenter/Camera2D
onready var switch_timer = $SwitchTimer

var canSwitch = false

func _ready():
	create_players(Vector2(0, -256), Vector2(0, 256), 1, 1, true)
	toggle_switch()

func _process(delta):
#	set symmetry
	symmetry_center.position.x = master_player.position.x
	
#	move puppet
	var master_position = master_player.position
	master_position.y += 2 * (symmetry_center.position.y - master_position.y)
	
	puppet_player.set_master_position(master_position)
	
#	switch master and puppet
	if Input.is_action_just_released("ui_accept") and canSwitch:
		if puppet_player.is_collided():
			impossible_switch()
		else:
			switch()

func get_x():
	return symmetry_center.position.x
	
func set_y(y):
	symmetry_center.position.y = y
	
func toggle_switch():
	canSwitch = true
	
func impossible_switch():
	print("Impossible Switch")
	
func remove_players():
	master_player.disconnect("jumped", self, "update_jumping_puppet")
	master_player.disconnect("walked", self, "update_walking_puppet")
	master_player.queue_free()
	puppet_player.queue_free()
	
func create_players(master_position, puppet_position, gravity_factor, scale_y, master_to_player_one):
	master_player = MasterPlayer.instance()
	puppet_player = PupperPlayer.instance()
	
	master_player.set_gravity_factor(gravity_factor)
	master_player.position = master_position
	master_player.name = "Master"
	master_player.scale.y = scale_y
	master_player.is_animation_to_player_one = master_to_player_one
	master_player.connect("jumped", self, "update_jumping_puppet")
	master_player.connect("walked", self, "update_walking_puppet")
	
	puppet_player.position = puppet_position
	puppet_player.name = "Puppet"
	puppet_player.scale.y = - scale_y
	puppet_player.is_animation_to_player_one = not master_to_player_one
	
	add_child(master_player)
	add_child(puppet_player)
	
func rotate_camera():
	camera.zoom.y = - camera.zoom.y
	
func switch():
	var master_position = master_player.position
	var puppet_position = puppet_player.position
	var gravity_factor = - master_player.gravity_factor
	remove_players()
	create_players(puppet_position, master_position, gravity_factor, -master_player.scale.y, not master_player.is_animation_to_player_one)
	
#	Start timer
	canSwitch = false
	switch_timer.start()
	
#	Visual Effect
	rotate_camera()

func _on_SwitchTimer_timeout():
	toggle_switch()
	
func update_jumping_puppet(is_jumping, is_walking_to_the_left):
	puppet_player.is_jumping = is_jumping
	puppet_player.is_walking_to_the_left = is_walking_to_the_left
	
func update_walking_puppet(is_walking, is_walking_to_the_left):
	puppet_player.is_walking = is_walking
	puppet_player.is_walking_to_the_left = is_walking_to_the_left

