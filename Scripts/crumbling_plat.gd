extends StaticBody2D

@onready var anim: AnimationPlayer = $anim
@export var spr: int = 0
@onready var sprite: Sprite2D = $sprite

func _ready():
	if spr == 0:
		sprite.frame = 13
	elif spr == 1:
		sprite.frame = 29
	elif spr == 2:
		sprite.frame = 45
	elif spr == 3:
		sprite.frame = 61

	$collision.disabled = false
	$area/area_col.disabled = false

func _on_area_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("cat"):
		if spr == 0:
			anim.play("world1")
		elif spr == 1:
			anim.play("world2")
		elif spr == 2:
			anim.play("world3")
		elif spr == 3:
			anim.play("world4")