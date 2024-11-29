extends VehicleBody3D


var car_sound = -11.105;
var car_sound_increase_scale = 0.5;
var car_sound_pitch_scale = 0.1;
@export var MAX_STEER = 0.9;
@export var ENGINE_POWER = 300;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	steering = move_toward(steering, Input.get_axis("right", "left")*MAX_STEER, delta*10);
	engine_force = Input.get_axis("down", "up") * ENGINE_POWER;
	
	if (Input.is_key_pressed(KEY_W)):
		if ($"car sound".pitch_scale > 2):
			$"car sound".pitch_scale = $"car sound".pitch_scale;
		else :
			$"car sound".pitch_scale += car_sound_pitch_scale;
			
		if ($"car sound".volume_db > 1):
			$"car sound".volume_db = $"car sound".volume_db;
		else:
			$"car sound".volume_db += car_sound_increase_scale;
	elif (Input.is_key_pressed(KEY_S)): # For reverse
		if ($"car sound".pitch_scale < -0.3):
			$"car sound".pitch_scale = $"car sound".pitch_scale;
		else :
			$"car sound".pitch_scale -= car_sound_pitch_scale;
			
		if ($"car sound".volume_db > 1):
			$"car sound".volume_db = $"car sound".volume_db;
		else:
			$"car sound".volume_db += car_sound_increase_scale;
	if (Input.is_action_just_released("up")):
		$"car sound".pitch_scale = 1;
		if ($"car sound".volume_db > (car_sound-1)):
			$"car sound".volume_db = car_sound;
		else:
			$"car sound".volume_db -= car_sound_increase_scale;


func _on_car_sound_finished() -> void: #  Play when the car sound is finished
	$"car sound".play();
