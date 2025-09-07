extends StaticBody2D

@onready var hit_col: CollisionShape2D = $hitbox/hit_col

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("cat"):
		#talvez uma animação com particulas
		hit_col.disabled = true

		queue_free()