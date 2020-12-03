extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var level = preload("res://Levels/Level4.tscn")

onready var area = get_node("Area2D")

export var exitReady = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func nextLevel():
	get_tree().change_scene_to(level)


func _on_Area2D_body_entered(body):
	if body.get_parent().name == "Player_Container" and exitReady:
		nextLevel()
