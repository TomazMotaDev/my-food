extends Node2D

@onready var foods: Node2D = $foods
@onready var portal: Area2D = $Portal

func _ready() -> void:
	Global.maxFood = foods.get_child_count()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.food != Global.maxFood:
		portal.visible = false
		portal.collision.disabled = true
	else:
		portal.visible = true
		portal.collision.disabled = false