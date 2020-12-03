extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const playerScene = preload("res://Player_Container.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not get_parent().has_node("Player_Container"):
		var player = playerScene.instance()
		player.position = position
		get_parent().add_child(player)
