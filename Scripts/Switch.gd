extends Node2D

var current_channel = 0
var channels = ["Static_", "Alien_", "Brick_", "West_"]
var current_area = 1
var area_path = "res://Scenes/Areas/"
var Area: Node = null

func _ready():
	load_area()

func load_area():

	# Load and instance the new Area
	Area = load("res://Scenes/Areas/Area_1/Area_1.tscn").instantiate()

	# Load and instance the channel nodes
	var channel_node = load("res://Scenes/Areas/Area_1/" + channels[current_channel] + "1.tscn").instantiate()

	# Add the new channel_node
	Area.add_child(channel_node)

func _unhandled_input(event):
	
	if event.is_action_pressed("switch_left"):
		print("The player has switched left")
		channel_switch_left()

	if event.is_action_pressed("switch_right"):
		print("The player has switched right")
		channel_switch_right()


# Handles changing of channels

func channel_switch_left():
	current_channel -= 1

	if current_channel < 0:
		current_channel = 3

	var full_path = area_path + "Area_" + str(current_area) + "/" + str(channels[current_channel]) + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)

func channel_switch_right():
	current_channel += 1

	if current_channel > 3:
		current_channel = 0

	var full_path = area_path + "Area_" + str(current_area) + "/" + str(channels[current_channel]) + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
