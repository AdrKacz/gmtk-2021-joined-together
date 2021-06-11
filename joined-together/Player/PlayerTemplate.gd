extends KinematicBody2D

export var GRAVITY = 2000.0
export var SPEED = 500.0
export var JUMP_FORCE = 1000.0

export var IS_REVERSED = true

var velocity = Vector2()

func _physics_process(delta):
#	Gravity
	if IS_REVERSED:
		velocity.y -= delta * GRAVITY
	else:
		velocity.y += delta * GRAVITY
		
	if is_on_floor():
		velocity.y = 0
	
#	Left / Right
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	else:
		velocity.x = 0
		
#	Jump
	if Input.is_action_pressed("ui_up") and is_on_floor():
		if IS_REVERSED:
			velocity.y += JUMP_FORCE
		else:
			velocity.y -= JUMP_FORCE
	
#	Movement
	if IS_REVERSED:
		move_and_slide(velocity, Vector2(0, 1))
	else:
		move_and_slide(velocity, Vector2(0, -1))
	
	
