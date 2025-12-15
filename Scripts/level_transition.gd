extends CanvasLayer

@onready var world: Label = $"Container/Vertical-Container/world"
@onready var life: Label = $"Container/Vertical-Container/life-box/life-points"
@onready var anim: AnimationPlayer = $anim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world.text = Global.world
	life.text = str(Global.life)

	if Global.world.ends_with(str(1)):
		anim.play("level_transition_1")
	elif Global.world.ends_with(str(2)):
		anim.play("level_transition_2")
	elif Global.world.ends_with(str(3)):
		anim.play("level_transition_3")
	elif Global.world.ends_with(str(4)):
		anim.play("level_transition_4")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
