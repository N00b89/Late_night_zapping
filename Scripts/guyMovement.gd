extends CharacterBody2D
class_name GuyController

@export var speed = 10.0
@export var jump_power = 15.0

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0
var paused = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	#menu = $PauseMenu
	pass

func _input(event):
	# Handle jump.
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
		
	#if Input.is_action_just_pressed("menu"):
		#pauseMenu()
		#
#func pauseMenu():
	#if paused:
		#menu.hide()
		#Engine.time_scale = 1
	#else:
		#menu.show()
		#Engine.time_scale = 0
		#
	#paused = !paused

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = jump_power * jump_multiplier / 3

	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:           
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()
