extends Path2D

@export var loop: bool = true
@export var speed: float = 2.0
@export var speed_scale: float = 1.0

@onready var pathFollow: PathFollow2D = $PathFollow
@onready var anim = $anim

@export var spr: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if not loop:
		if spr == 0:
			anim.play("world1")
		elif spr == 1:
			anim.play("world2")
		elif spr == 2:
			anim.play("world3")
		elif spr == 3:
			anim.play("world4")
		anim.speed_scale = speed_scale
		set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pathFollow.progress += speed * delta
