extends StaticBody2D

@onready var timer: Timer = $Timer
@onready var anim: AnimationPlayer = $anim
@onready var sprite: Sprite2D = $sprite
@onready var bullet_spawn: Marker2D = $BulletSpawn

var bullet = preload("res://Scenes/bullet.tscn")

#False = para a direita | True = para a esquerda
@export var dir: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !dir:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func _on_timer_timeout() -> void:
	anim.play("anim")
	var new_bullet = bullet.instantiate()
	new_bullet.dir = dir
	add_child(new_bullet)
	new_bullet.global_position = bullet_spawn.global_position
	new_bullet.sprite.scale = Vector2(5.0, 5.0)
	new_bullet.wall.scale = Vector2(5.0, 5.0)
	new_bullet.collision.scale = Vector2(5.0, 5.0)
	new_bullet.area.scale = Vector2(5.0, 5.0)
	
