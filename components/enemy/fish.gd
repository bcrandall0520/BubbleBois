extends Node2D

func _ready():
	%AnimationPlayer.play('Eye')


func _on_fish_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.call("pop")
