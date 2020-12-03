extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2.ZERO
var direction = 1
var onGround = false
var currentAnimation = null
var jumped = false

onready var raycast1 = get_node("RayCast2D")
onready var raycast2 = get_node("RayCast2D2")

export var speed = 5
export var jump = 5
export var gravity = Vector2(0, 30)
export var deathHeight = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction < 0 and not $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = true
	if direction > 0 and $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = false
	
	if position.y > deathHeight:
		die()
	
	onGround = raycast1.is_colliding() or raycast2.is_colliding()
	
	if not onGround:
		velocity.y += gravity.y * delta
	elif velocity.y != 0:
		if jumped:
			$AnimatedSprite.animation = currentAnimation
			jumped = false
		velocity.y = 0
	
	if Input.is_action_just_pressed("Jump") and onGround:
		velocity.y -= jump
		$AnimatedSprite.animation = "Jump"
		jumped = true
	
	if Input.is_action_just_pressed("Left"):
		direction = -1
		velocity.x = speed * -1
		if $AnimatedSprite.animation != "Jump":
			$AnimatedSprite.animation = "Walking"
			currentAnimation = "Walking"
		
	if Input.is_action_just_pressed("Right"):
		direction = 1
		velocity.x = speed
		if $AnimatedSprite.animation != "Jump":
			$AnimatedSprite.animation = "Walking"
			currentAnimation = "Walking"
	
	if (Input.is_action_just_released("Left") and not Input.is_action_pressed("Right")) or (Input.is_action_just_released("Right") and not Input.is_action_pressed("Left")):
			velocity = Vector2.ZERO
			$AnimatedSprite.animation = "Idle"
			currentAnimation = "Idle"
	
	if velocity != Vector2.ZERO:
		move_and_collide(velocity)

func die():
	get_parent().queue_free()
