extends CharacterBody2D


func _process(delta: float) -> void:
	if $"/root/PlayerWatch".player.in_water:
		$FishNode.idle = false
	else:
		$FishNode.idle = true
	
