extends Node2D

onready var exitNode = get_node("/root/Game/EndPoint")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func openDoor() :
	$AnimatedSprite.play("Open")
	$DoorOpen.play()
	exitNode.exitReady = true
	


func _on_Button_button_pressed():
	openDoor() # Replace with function body.

