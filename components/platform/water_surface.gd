extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("player_1_fast_fall"):
	$StaticBody2D/CollisionShape2D.set_deferred("disabled",true)
	#else:
		#$StaticBody2D/CollisionShape2D.set_deferred("disabled",false)
	pass
