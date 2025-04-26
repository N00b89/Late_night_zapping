extends CanvasLayer
class_name Menu

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.

func _input(event: InputEvent):
	if event.is_action_pressed(&"menu"):
		pauseMenu()

func pauseMenu():
	if get_tree().paused:
		self.hide()
		get_tree().paused = false
	else:
		self.show()
		get_tree().paused = true


func _on_resume_pressed() -> void:
	pauseMenu()

func _on_restart_pressed() -> void:
	GuyMovement.setting_position()

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
