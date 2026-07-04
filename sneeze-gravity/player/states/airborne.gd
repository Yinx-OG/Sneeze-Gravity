extends State

#region Tuning
@export var air_acceleration: float = 1000.0
@export var max_speed: float = 300.0
#endregion

#region References
var player: CharacterBody2D
#endregion


func enter() -> void:
	player = get_owner()
	

func physics_update(delta: float) -> void:
	player.velocity.y += GravityManager.dir_sign * GravityManager.strength * delta
	
	var direction := Input.get_axis("move_left", "move_right")
	player.velocity.x = move_toward(player.velocity.x, direction * max_speed, air_acceleration * delta)
	
	player.move_and_slide()
	
	if player.is_on_floor():
		transition_requested.emit("Grounded")
