extends Area2D

const EPSILON = 0

onready var animation = $AnimatedPlayer

var is_jumping = false
var is_walking = false
var is_walking_to_the_left = false

var is_animation_to_player_one = false

var master_position = Vector2()
var collision_count = 0

func _ready():
	set_animation_to_player_one(is_animation_to_player_one)
	
func set_animation_to_player_one(is_to_player_one):
	if is_to_player_one:
		animation.current_prefix = animation.player_one_prefix
	else:
		animation.current_prefix = animation.player_two_prefix

func _process(delta):
	if (position - master_position).length() > EPSILON:
		position = master_position
	
#	animation
	if is_jumping:
		animation.jump()
	elif is_walking:
		animation.walk(is_walking_to_the_left)
	else:
		animation.idle()

func set_master_position(position):
	master_position = position

		
func is_collided():
	return collision_count > 0


func _on_InnerArea_body_entered(body):
	collision_count += 1


func _on_InnerArea_body_exited(body):
	collision_count -= 1
	if collision_count < 0:
		 collision_count = 0


func _on_DiamArea_area_entered(area):
	if (area.is_in_group("diam")):
		Session.add_value(area.value)
		Session.add_category_count(area.category)
		area.queue_free()
