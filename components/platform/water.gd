extends Node2D
@onready var audio_stream_player: AudioStreamPlayer = $WaterArea/AudioStreamPlayer


func _on_water_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		#var charbody = body.get_node("CharacterBody2D")
		body.call("pushup", 2);
		audio_stream_player.play();
	#body.apply_force(10) # maybe scale force with time and depth?
	pass # Replace with function body.


func _on_water_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		#var charbody = body.get_node("CharacterBody2D")
		body.call("leftTheWater");
		audio_stream_player.play();
	pass # Replace with function body.
