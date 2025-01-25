extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -1000.0
const FAST_FALL_VELOCITY = 1000.0

var IN_WATER;

func _ready():
	var IN_WATER = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_1_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("player_1_fast_fall") and !is_on_floor():
		velocity.y = FAST_FALL_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player_1_left", "player_1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if IN_WATER:
		velocity.y = velocity.y - 100;
	else:
		pass

	move_and_slide()
	
func pushup(force: float):
	IN_WATER = true;
	
func leftTheWater():
	IN_WATER = false;
