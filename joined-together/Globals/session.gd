extends Node


export (String, FILE, "*.tscn") var start_menu_path = "res://Game/StartWorld/StartMenu.tscn"
export (String, FILE, "*.tscn")  var first_world_path = "res://Game/World-02/WorldManager.tscn"

signal update_value(value)
signal update_categories(categories_count)
signal update_time(time)

var initial_value = 0
var value = initial_value
var initial_count = [0,0,0]
var categories_count = [] + initial_count
var time = 0

onready var timer = $Timer

var current_world

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
	initial_value = 0
	value = initial_value
	initial_count = [0,0,0]
	categories_count = [] + initial_count
	time = 0
	start_timer()
	get_tree().change_scene(first_world_path)
	
func restart_game():
	get_tree().change_scene(start_menu_path)
	

func succeed_world(next_world):
	initial_value = value
	initial_count = [] + categories_count
	change_world(next_world)
	
func change_world(world):
	get_tree().change_scene_to(world)
	
func die():
	restart_world()
	
	
