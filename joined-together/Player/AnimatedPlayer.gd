extends AnimatedSprite


export (String) var player_one_prefix
export (String) var player_two_prefix

var current_prefix

func _ready():
	current_prefix = player_one_prefix
	play()

func jump(flip):
	animation = current_prefix + "-jump"
	flip_h = flip
	if $snow:
		print($snow.one_shot, $snow.emitting)
		$snow.emitting = true
		$snow.one_shot = true

func walk(flip):
	animation = current_prefix + "-walk"
	flip_h = flip
	
func idle():
	animation = current_prefix + "-idle"
	
func crouch():
	animation = current_prefix + "-crouch"
