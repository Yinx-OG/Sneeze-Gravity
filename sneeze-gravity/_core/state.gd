class_name State
extends Node

#region Signals
signal transition_requested(state_name: String)
#endregion

#region Lifecycle Hooks
func enter() -> void:
	pass

func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass
#endregion
