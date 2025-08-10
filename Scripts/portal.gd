extends Area2D

@onready var collision: CollisionShape2D = $collision

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("cat"):
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = "res://Levels/level_" + str(next_level_number) + ".tscn"
		
		if next_level_number >= 4:
			Global.world = "2-" + str(next_level_number - 4)
		elif next_level_number >= 8:
			Global.world = "3-" + str(next_level_number - 8)
		elif next_level_number >= 12:
			Global.world = "4-" + str(next_level_number - 12)
		else:
			Global.world = "1-" + str(next_level_number)
			
		Global.food = 0
		
		get_tree().change_scene_to_file(next_level_path)