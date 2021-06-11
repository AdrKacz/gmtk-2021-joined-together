extends Control

signal show_menu

var object = null
var action = ""

func _ready():
	_display_keys()

func _input(event):
	if event is InputEventKey and event.pressed:
		if action != "":
			var input_event = InputEventKey.new()
			input_event.scancode = event.scancode
			InputMap.action_erase_events(action)
			InputMap.action_add_event(action, input_event)
			object.text = OS.get_scancode_string(event.scancode)
			action = ""

func _on_Back_pressed():
	get_tree().change_scene("res://GUI/Menu.tscn")

func _display_keys():
	$MarginContainer/HBoxContainer/VBoxContainer/up/upText.text = OS.get_scancode_string(InputMap.get_action_list("ui_up")[0].scancode)
	$MarginContainer/HBoxContainer/VBoxContainer/down/downText.text = OS.get_scancode_string(InputMap.get_action_list("ui_down")[0].scancode)
	$MarginContainer/HBoxContainer/VBoxContainer/left/leftText.text = OS.get_scancode_string(InputMap.get_action_list("ui_left")[0].scancode)
	$MarginContainer/HBoxContainer/VBoxContainer/right/rightText.text = OS.get_scancode_string(InputMap.get_action_list("ui_right")[0].scancode)
	$MarginContainer/HBoxContainer/VBoxContainer/switch/switchText.text = OS.get_scancode_string(InputMap.get_action_list("ui_switch")[0].scancode)

func _on_reset_pressed():
	InputMap.load_from_globals()
	_display_keys()

func _on_up_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/up/upText.text = "press a key"
	action = "ui_up"
	object = $MarginContainer/HBoxContainer/VBoxContainer/up/upText


func _on_down_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/down/downText.text = "press a key"
	action = "ui_down"
	object = $MarginContainer/HBoxContainer/VBoxContainer/down/downText


func _on_left_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/left/leftText.text = "press a key"
	action = "ui_left"
	object = $MarginContainer/HBoxContainer/VBoxContainer/left/leftText


func _on_right_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/right/rightText.text = "press a key"
	action = "ui_right"
	object = $MarginContainer/HBoxContainer/VBoxContainer/right/rightText


func _on_switch_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/switch/switchText.text = "press a key"
	action = "ui_switch"
	object = $MarginContainer/HBoxContainer/VBoxContainer/switch/switchText
