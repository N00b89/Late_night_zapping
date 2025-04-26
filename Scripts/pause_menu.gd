extends CanvasLayer
class_name Menu


var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.

func _input(_event):
	if Input.is_action_just_pressed("menu"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		self.hide()
		Engine.time_scale = 1
	else:
		self.show()
		Engine.time_scale = 0
	
	print(paused)
	paused = !paused


func _on_resume_pressed() -> void:
	pauseMenu()

func _on_restart_pressed() -> void:
	GuyMovement.setting_position()

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
