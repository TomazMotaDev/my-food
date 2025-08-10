extends RigidBody2D

const speed: float = 50.0

#False = para a direita | True = para a esquerda
var dir: bool = false

@onready var sprite: Sprite2D = $sprite
@onready var wall: RayCast2D = $wall
@onready var collision: CollisionShape2D = $collision
@onready var area: Area2D = $area

func _ready() -> void:
	
	if !dir:
		sprite.flip_h = false
		wall.target_position.x = -3
	else:
		sprite.flip_h = true
		wall.target_position.x = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.y = 0 * delta

	if !dir:
		position.x += -1 * speed * delta
	else:
		position.x += speed * delta
	
	if wall.is_colliding():
		queue_free()


func _on_area_area_entered(area:Area2D) -> void:
	if area.is_in_group("cat"):
		queue_free()
