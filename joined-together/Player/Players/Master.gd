extends KinematicBody2D

export var speed = 500.0
export var gravity = 2000.0
export var jump_force = 1000.0

var gravity_factor

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func set_gravity_factor(new_gravity_factor):
	gravity_factor = new_gravity_factor


func _physics_process(delta):
#	gravity
	velocity.y += delta * gravity * gravity_factor
	if is_on_floor():
		velocity.y = 0
	
#	left and right
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0
		
#	jump
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y -= jump_force * gravity_factor
		
#	movement
	move_and_slide(velocity, Vector2(0, -1 * gravity_factor))
