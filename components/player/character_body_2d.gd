extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -3000.0
const FAST_FALL_VELOCITY = 1000.0

var in_water
var fastfalling
signal dead

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
    #get_tree().paused = true
