extends CharacterBody2D

const speed = 1300
const detection_range = 9000
var player
var fish_sprite

func _ready() -> void:
	player = $"/root/PlayerWatch".player
	fish_sprite = $FishNode/Path2D/PathFollow2D/FishSprite
	
func _process(delta: float) -> void:
	var dist = player.global_position.x - fish_sprite.global_position.x
	if player.in_water and dist < detection_range and -dist < detection_range:
		$FishNode.idle = false
		seek(delta)
	else:
		$FishNode.idle = true
		
func seek(delta):
	var player_pos = player.global_position
	var fish_pos = fish_sprite.global_position
	var direction_to_player = fish_pos.direction_to(player_pos)
	
	global_position += direction_to_player * delta * speed
	
	if direction_to_player.x < 0:
		fish_sprite.flip_h = true
		
	else:
		fish_sprite.flip_h = false
	
	fish_sprite.rotation = direction_to_player.angle()
