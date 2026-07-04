extends Sprite2D

func _ready() -> void:
	SignalBus.gravity_flipped.connect(_on_gravity_flipped)

func _on_gravity_flipped(new_direction: GravityDirection.Direction) -> void:
	rotation = PI if new_direction == GravityDirection.Direction.UP else 0.0
