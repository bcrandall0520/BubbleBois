extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -1000.0
const FAST_FALL_VELOCITY = 1000.0

var IN_WATER;

func _ready():
	var IN_WATER = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not IN_WATER:
		velocity += get_gravity() * delta
		velocity.y -= velocity.y * delta
	else:
		velocity -= get_gravity() * delta
		velocity.y -= velocity.y * delta


	# Handle jump.
	if Input.is_action_just_pressed("player_1_jump"):
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("player_1_fast_fall"):
		velocity.y = FAST_FALL_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player_1_left", "player_1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
func pushup(force: float):
	IN_WATER = true;
	
func leftTheWater():
	IN_WATER = false;
