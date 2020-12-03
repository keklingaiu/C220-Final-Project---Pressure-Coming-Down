extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 1
export var waitTime = 1

onready var start = get_node("Start")
onready var end = get_node("End")
onready var platform = get_node("Platform")
onready var timer = get_node("Timer")

var reached = false
var direction = true
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = waitTime
	timer.stop()

var t = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if reached:
		if timer.is_stopped():
			if player != null:
				player.velocity.x = 0
			timer.start()
	elif t >= 1 and direction:
		reached = true
	elif t <= 0 and not direction:
		reached = true
	else:
		if direction:
			t += delta * speed
			platform.position = start.position.linear_interpolate(end.position, t)
			if player != null:
				player.velocity.x = speed * 3.25
		else:
			t -= delta * speed
			platform.position = start.position.linear_interpolate(end.position, t)
			if player != null:
				player.velocity.x = speed * 3.25 * -1
	
	


func _on_Timer_timeout():
	reached = false
	direction = !direction
	timer.stop()




func _on_Area2D_body_entered(body):
	print(body.name)
	if body.name == "Player":
		player = body
		player.onPlatform = true
