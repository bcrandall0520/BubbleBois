extends Sprite2D

func _ready():
	$FlyAnimation.play('Idle')
	

func _on_fly_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.call("pop")
