extends State

#region Tuning
@export var max_speed: float = 300.0
@export var acceleration: float = 1500.0
@export var friction: float = 1800.0
#endregion

#region References
var player: CharacterBody2D
#endregion

func enter() -> void:
	player = get_owner()
	SignalBus.gravity_flipped.connect(_on_gravity_flipped)

func exit() -> void:
	SignalBus.gravity_flipped.disconnect(_on_gravity_flipped)

func physics_update(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		player.velocity.x = move_toward(player.velocity.x, direction * max_speed, acceleration * delta)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, friction * delta)
	
	player.move_and_slide()
	
	if not player.is_on_floor():
		transition_requested.emit("Airborne")

func _on_gravity_flipped(_new_direction: GravityDirection.Direction) -> void:
	transition_requested.emit("Airborne")
