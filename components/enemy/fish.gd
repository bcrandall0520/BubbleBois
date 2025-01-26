extends Node2D

const speed = 0.1

func _ready():
	%AnimationPlayer.play('Eye')


func _on_fish_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.call("pop")


func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress_ratio += delta * speed
	if $Path2D/PathFollow2D.progress_ratio > 0.52:
		$Path2D/PathFollow2D/FishSprite.flip_v = true
	else:
		$Path2D/PathFollow2D/FishSprite.flip_v = false
