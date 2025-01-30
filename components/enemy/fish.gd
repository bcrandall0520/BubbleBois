extends Node2D

const speed = 0.2
var idle

func _ready():
	%AnimationPlayer.play('Eye')
	idle = true
	$Path2D/PathFollow2D.progress_ratio = randf()	


func _on_fish_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.call("pop")


func _process(delta: float) -> void:
	if idle:
		$Path2D/PathFollow2D.progress_ratio += delta * speed
		if $Path2D/PathFollow2D.progress_ratio > 0.52:
			$Path2D/PathFollow2D/FishSprite.flip_v = true
		else:
			$Path2D/PathFollow2D/FishSprite.flip_v = false
