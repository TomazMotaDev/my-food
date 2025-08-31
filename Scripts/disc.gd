extends CharacterBody2D

@export var SPEED = 1400.0 * 4
@onready var anim = $aniSprite
@onready var rayWall = $rayWall
@onready var rayFall = $rayFall

var direction: int = 1

func _physics_process(delta: float) -> void:
	
	if not rayFall.is_colliding() && is_on_floor():
		direction *= -1
		rayWall.scale.x *= -1
	elif rayWall.is_colliding():
		direction *= -1
		rayWall.scale.x *= -1
	
	if direction > 0:
		anim.flip_h = true
		rayFall.position.x = 4
	else:
		anim.flip_h = false
		rayFall.position.x = -4
		
	velocity.x = direction * SPEED * delta
	
	move_and_slide()