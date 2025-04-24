extends CanvasLayer
class_name Menu


var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.


func _unhandled_input(event):
	if Input.is_action_just_pressed("menu"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		self.hide()
		Engine.time_scale = 1
	else:
		self.show()
		Engine.time_scale = 0
		
	paused = !paused
