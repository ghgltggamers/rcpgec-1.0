extends VehicleBody3D



@export var MAX_STEER = 0.9;
@export var ENGINE_POWER = 300;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	steering = move_toward(steering, Input.get_axis("right", "left")*MAX_STEER, delta*10);
	engine_force = Input.get_axis("down", "up") * ENGINE_POWER;
