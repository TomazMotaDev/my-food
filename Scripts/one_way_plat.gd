extends StaticBody2D

@export var spr = 0
@onready var anim: AnimationPlayer = $anim


func _ready() -> void:
	if spr == 0:
		anim.play("world1")
	elif spr == 1:
		anim.play("world2")
	elif spr == 2:
		anim.play("world3")
	elif spr == 3:
		anim.play("world4")