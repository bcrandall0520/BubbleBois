extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -3000.0
const FAST_FALL_VELOCITY = 1000.0

var in_water
var fastfalling
signal dead

#@onready var waterbody = preload("res://components/platform/springyWater/Scenes/Water_Body.tscn")
#var bodies = [];

func _ready():
	var in_water = false
	var fastfalling = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not in_water:
		if fastfalling:
			velocity += get_gravity() * delta * 4
		else:
			velocity += get_gravity() * delta * 0.8
		velocity.y -= velocity.y * delta * 0.7
	else:
		if fastfalling and velocity.y > 0:
			velocity -= get_gravity() * delta * 2
		else:
			velocity -= get_gravity() * delta * 4
		velocity.y -= velocity.y * delta * 0.7
		fastfalling = false

	# Handle jump.
	if Input.is_action_just_pressed("player_1_jump"):
		if in_water:
			velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("player_1_fast_fall"):
		velocity.y = FAST_FALL_VELOCITY
		
	if Input.is_action_pressed("player_1_fast_fall"):
		fastfalling = true
	else:
		fastfalling = false
		
	var waterLoc = int(position.x - 1000) / 9900;
	
	print(waterLoc)
	for i in range(3):
		get_parent().get_parent().get_child(3).get_child(i).position = Vector2(-1000 + 9900 * (waterLoc + i -1), 0)
	if waterLoc==0:
		get_parent().get_parent().get_child(3).get_child(0).visible = false;
	else:
		get_parent().get_parent().get_child(3).get_child(0).visible = true;
	#get_parent().get_parent().get_child(3).get_child(0)
	#print(get_parent().get_parent().get_child(3).get_child(0))
	#w = waterbody.instance();
	#w.queue_free()
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player_1_left", "player_1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
func pushup(force: float):
	in_water = true
	
func leftTheWater():
	in_water = false

func pop():
	get_parent().get_child(0).visible = false
	const BUBLE_POP = preload("res://assets/bubble/bubble_pop.tscn")
	var pop = BUBLE_POP.instantiate()
	get_parent().add_child(pop)
	pop.global_position = global_position
	
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()
		#get_tree().paused = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("wall"):
		velocity.y = velocity.y * -0.0
