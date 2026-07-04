extends Node

#region Tuning
@export var min_interval: float = 2.0
@export var max_interval: float = 5.0
#endregion

#region State
var time_left: float = 0.0
#endregion

func _ready() -> void:
	_reset_timer()

func _process(delta: float) -> void:
	time_left -= delta
	
	if time_left <= 0.0:
		SignalBus.sneeze_triggered.emit()
		_reset_timer()

func _reset_timer() -> void:
	time_left = randf_range(min_interval, max_interval)
