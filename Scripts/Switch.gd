extends Node2D

var current_channel = 0
var channels = ["Static_", "Alien_", "Brick_", "West_"]
var current_area = 1
var area_path = "res://Scenes/Areas/"
var saved_position = Vector2()

func _ready():
	var node1_scene = load("res://Scenes/Areas/Area_1/Area_1.tscn")
	var node1 = node1_scene.instantiate()
	var node2 = node1.get_child(0)
	var character_body = node2.get_child(0)
	
	# Load and instance the new Node2D2
	var node2_scene = load("res://Scenes/Areas/Area_1/" + channels[current_channel] + "1.tscn")
	var new_node2 = node2_scene.instantiate()
	
	# Remove old Node2D2
	node2.queue_free()
	
	# Add the new Node2D2 and reparent CharacterBody2D
	node1.add_child(new_node2)
	new_node2.add_child(character_body)
	
	
	# Ensure correct positioning (optional)
	character_body.position = Vector2.ZERO
	#character_body.ordering.z_index = 1
	character_body.visibility.tob_level = true

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

	print(position)
	var full_path = area_path + "Area_" + str(current_area) + "/" + str(channels[current_channel]) + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)

func channel_switch_right():
	current_channel += 1

	if current_channel > 3:
		current_channel = 0

	print(position)
	var full_path = area_path + "Area_" + str(current_area) + "/" + str(channels[current_channel]) + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
