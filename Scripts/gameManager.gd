extends Node

# Handles changing of levels
var current_area = 1
var area_path = "res://Scenes/Areas/"

func _ready():
	add_child(load("res://Scenes/guy.tscn").instantiate())

func next_level():
	current_area += 1
	var full_path = area_path + "Area_" + str(current_area) + "/Static_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print(&"The player has moved to area " + str(current_area))
