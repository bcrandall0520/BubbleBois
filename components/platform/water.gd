extends Node2D


func _on_water_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		#var charbody = body.get_node("CharacterBody2D")
		body.call("pushup", 2);
	#body.apply_force(10) # maybe scale force with time and depth?
	pass # Replace with function body.


func _on_water_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		#var charbody = body.get_node("CharacterBody2D")
		body.call("leftTheWater");
	pass # Replace with function body.
