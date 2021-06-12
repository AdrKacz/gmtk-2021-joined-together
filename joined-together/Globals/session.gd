extends Node

signal update_value(value)
signal update_categories(categories_count)
signal update_time(time)

var initial_value = 0
var value = initial_value
var initial_count = [0,0,0]
var categories_count = initial_count

onready var timer = $Timer
var time = 0

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
	categories_count = initial_count

func succeed_world():
	initial_value = value
	initial_count = categories_count
	
