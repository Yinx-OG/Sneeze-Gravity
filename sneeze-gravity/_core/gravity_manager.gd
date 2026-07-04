extends Node

var direction: GravityDirection.Direction = GravityDirection.Direction.DOWN
var dir_sign: int = 1
var strength: float = 980.0

func _ready() -> void:
	SignalBus.sneeze_triggered.connect(flip)

func flip() -> void:
	if direction == GravityDirection.Direction.DOWN:
		direction = GravityDirection.Direction.UP
		dir_sign = -1
	else:
		direction = GravityDirection.Direction.DOWN
		dir_sign = 1
	
	SignalBus.gravity_flipped.emit(direction)
