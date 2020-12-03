extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal button_pressed

var pressedTexture = preload("res://Sprites/button_pressed.png")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Box":
		get_node("button_default").set_texture(pressedTexture)
		emit_signal("button_pressed")
		body.set_collision_layer_bit(0, false)
		body.set_collision_mask_bit(0, false)
