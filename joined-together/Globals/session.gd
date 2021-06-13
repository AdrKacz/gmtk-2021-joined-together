extends Node


export (String, FILE, "*.tscn") var start_menu_path = "res://Game/StartWorld/StartMenu.tscn"
export (String, FILE, "*.tscn")  var first_world_path = "res://Game/World-02/WorldManager.tscn"
export (PackedScene)  var OptionMenu = preload("res://GUI/Options.tscn")

signal update_value(value)
signal update_categories(categories_count)
signal update_time(time)

var initial_value = 0
var value = initial_value
var initial_count = [0,0,0]
var categories_count = [] + initial_count
var time = 0

onready var timer = $Timer
onready var root = get_tree().get_root()

var current_world
var last_scene_path = start_menu_path

var option_menu
var local_camera

func assign_camera(camera):
	local_camera = camera
	
func options_with_opacity():
	get_tree().paused = true
	stop_timer()
	option_menu = OptionMenu.instance()
	option_menu.set_opacity()
	if local_camera != null:
		local_camera.add_child(option_menu)
	else:
		root.get_child(root.get_child_count() - 1).add_child(option_menu)

func options():
	get_tree().paused = true
	stop_timer()
	option_menu = OptionMenu.instance()
	if local_camera != null:
		local_camera.add_child(option_menu)
	else:
		root.get_child(root.get_child_count() - 1).add_child(option_menu)
	
func quit_options():
	get_tree().paused = false
	stop_timer()
	option_menu.queue_free()
	
func change_scene(scene):
	local_camera = null
	var current_scene = root.get_child(root.get_child_count() - 1)
	last_scene_path = current_scene.get_filename()
	get_tree().change_scene_to(scene)

func change_scene_path(path):
	local_camera = null
	var current_scene = root.get_child(root.get_child_count() - 1)
	last_scene_path = current_scene.get_filename()
	get_tree().change_scene(path)
	
func add_value(added):
	value += added
	emit_signal("update_value", value)
	
func add_category_count(category):
	categories_count[category] += 1
	emit_signal("update_categories", categories_count)
	
func start_timer():
	timer.start()
	
func stop_timer():
	timer.stop()
	
func _on_Timer_timeout():
	time += 1
	emit_signal("update_time", time)
	
func restart_world():
	value = initial_value
	categories_count = [] + initial_count
	get_tree().reload_current_scene()

func start():
	stop_timer()
	initial_value = 0
	value = initial_value
	initial_count = [0,0,0]
	categories_count = [] + initial_count
	time = 0
	start_timer()
	change_scene_path(first_world_path)
	
func restart_game():
	change_scene_path(start_menu_path)
	

func succeed_world(next_world):
	initial_value = value
	initial_count = [] + categories_count
	change_world(next_world)
	
func change_world(world):
	change_scene(world)
	
func die():
	restart_world()
	
	
