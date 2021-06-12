extends KinematicBody2D

export var speed = 500.0
export var gravity = 2000.0
export var jump_force = 1000.0

var gravity_factor

var velocity = Vector2()
var is_jumping = false
var is_walking = false

func _ready():
	$AnimatedSprite.play()

func set_gravity_factor(new_gravity_factor):
	gravity_factor = new_gravity_factor


func _physics_process(delta):
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
		
#	jump
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y -= jump_force * gravity_factor
		is_jumping = true
	
#	movement
	move_and_slide(velocity, Vector2(0, -1 * gravity_factor))
	
func _process(delta):
	if is_jumping:
		$AnimatedSprite.animation = "jump"
	elif is_walking:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = "stand"
	
