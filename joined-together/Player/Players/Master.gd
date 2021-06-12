extends KinematicBody2D

signal jumped(is_jumping)
signal walked(is_walking, flip)

export var speed = 500.0
export var gravity = 2000.0
export var jump_force = 1000.0

var gravity_factor

var velocity = Vector2()
var is_jumping = false
var is_walking = false
var is_walking_to_the_left = false

var is_animation_to_player_one = true

onready var animation = $AnimatedPlayer

func _ready():
	set_animation_to_player_one(is_animation_to_player_one)

func set_gravity_factor(new_gravity_factor):
	gravity_factor = new_gravity_factor
	
func set_animation_to_player_one(is_to_player_one):
	if is_to_player_one:
		animation.current_prefix = animation.player_one_prefix
	else:
		animation.current_prefix = animation.player_two_prefix

func _physics_process(delta):
#	initials for performance
	var initial_is_jumping = is_jumping
	var initial_is_walking = is_walking
	var initial_is_walking_to_the_left = is_walking_to_the_left
#	gravity
	velocity.y += delta * gravity * gravity_factor
	if is_on_floor():
		velocity.y = 0
		is_jumping = false
	
#	left and right
	is_walking = true
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0
		is_walking = false
	is_walking_to_the_left = velocity.x < 0
		
#	jump
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y -= jump_force * gravity_factor
		is_jumping = true
	
#	movement
	move_and_slide(velocity, Vector2(0, -1 * gravity_factor))
	
#	send signals
	if initial_is_jumping != is_jumping:
		emit_signal("jumped", is_jumping, is_walking_to_the_left)
	if initial_is_walking != is_walking:
		emit_signal("walked", is_walking, is_walking_to_the_left)
	if initial_is_walking_to_the_left != is_walking_to_the_left:
		emit_signal("walked", is_walking, is_walking_to_the_left)
	
func _process(delta):
	if is_jumping:
		animation.jump(is_walking_to_the_left)
	elif is_walking:
		animation.walk(is_walking_to_the_left)
	else:
		animation.idle()
	
