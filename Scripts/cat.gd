extends CharacterBody2D

const SPEED: float = 65.0 * 4
const JUMP_VELOCITY: float = -350.0 * 2

@export var initX: float = 0
@export var initY: float = 0

@onready var aniSprite = $AniSprite

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * 2 * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if !is_on_floor():
			aniSprite.play("jump")
		else:
			aniSprite.play("run")
			
		if velocity.x < 0:
			aniSprite.flip_h = true
		else:
			aniSprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		aniSprite.play("idle")
		if !is_on_floor():
			aniSprite.play("jump")

	move_and_slide()

func collisionObjects(area: Area2D) -> void:
	if area.is_in_group("spike") or area.is_in_group("disc") or area.is_in_group("pit") or area.is_in_group("bullet"):
		Global.life -= 1
		position = Vector2(initX, initY)
		
	elif area.is_in_group("food"):
		Global.food +=1
	
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("ui_down") && is_on_floor()):
		position.y += 1