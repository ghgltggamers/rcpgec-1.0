extends Node3D


var player_is_on = "lobby";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"3d/Camera3D".position.z = get_viewport().get_mouse_position().x * 0.01 * delta;


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play();


func _on_start_btn_button_down() -> void: # This will run once the start button is clicked
	$click.play();
	get_tree().change_scene_to_file("res://scenes/lvel/map.tscn"); # Change the scene to level scene


func _on_settinga_btn_button_down() -> void:
	$click.play();
	$"2d/ui/settings_Window".show();


func _on_close_settingas_button_down() -> void:
	$click.play();
	$"2d/ui/settings_Window".hide();
