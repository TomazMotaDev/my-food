extends Control

@onready var food_count: Label = $MarginContainer/Food_counter/foods as Label
@onready var world_label: Label = $MarginContainer/World/curWorld as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#visible = false
	#await get_tree().create_timer(1.1).timeout
	#visible = true

	food_count.text = str(Global.food) + "/" + str(Global.maxFood)
	world_label.text = Global.world
