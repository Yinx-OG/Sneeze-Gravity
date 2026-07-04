class_name StateMachine
extends Node

#region Exported Configs
@export var intial_state: State
#endregion


#region State
var current_state: State
var states: Dictionary = {}
#endregion


#region Lifecycle
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transition_requested.connect(_on_transition_requested)
	
	if intial_state:
		current_state = intial_state
		current_state.enter()

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func _unhandled_input(event: InputEvent) -> void:
	current_state.handle_input(event)


#region Transitions
func _on_transition_requested(state_name: String) -> void:
	_transition_to(state_name)

func _transition_to(state_name: String) -> void:
	if not states.has(state_name):
		push_warning("StateMachine: no state named '%s' found." % state_name)
		return
	
	if current_state:
		current_state.exit()
	
	current_state = states[state_name]
	current_state.enter()
#endregion
