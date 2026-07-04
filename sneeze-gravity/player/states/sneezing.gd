extends State

#region Tuning
@export var min_buildup: float = 0.2
@export var max_buildup: float = 0.6

@export var friction: float = 2000.0
#endregion

#region References
var player: CharacterBody2D
#endregion

func enter(data: Dictionary = {}) -> void:
	player = get_owner()
	
	var immediate: bool = data.get("immediate", false)
	
	if immediate:
		_do_flip()
	else:
		_do_flip()


func physics_update(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, friction * delta)
	
	player.velocity.y += GravityManager.dir_sign * GravityManager.strength * delta
	player.move_and_slide()

func _do_flip() -> void:
	GravityManager.flip()
	
	if player.is_on_floor():
		transition_requested.emit("Grounded", {})
	else:
		transition_requested.emit("Airborne", {})
