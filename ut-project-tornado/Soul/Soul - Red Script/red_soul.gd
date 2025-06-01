extends CharacterBody2D

@export var SoulSpeed = 200
@export var IsBlue = false
@export var IsParry = false
@export var gravity = 17
var BlueSoulJump = 200


const terminal : float = 650.0

@export var jumpTime = 0.3
var jumpRemaining = jumpTime
var feet = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input(delta):
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	var BlueSoulDir = Input.get_axis("Left", "Right")
	if IsBlue == false:
		velocity = dir * SoulSpeed
		
	else: 
		velocity.x = BlueSoulDir * SoulSpeed
		if (Input.is_action_pressed("Up")) and jumpRemaining > 0 and feet:
			velocity.y = -BlueSoulJump
			jumpRemaining -= delta
			print(jumpRemaining)

	if Input.is_action_pressed("SlowDown"):
		if IsBlue:
			velocity.x /= 2
		else:
			velocity = velocity /2
			
	if Input.is_action_just_released("Up"):
		feet = false	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input(delta)
	
	if is_on_floor():
		jumpRemaining = jumpTime
		feet = true
	if !Input.is_action_pressed("Up") || jumpRemaining <= 0:
		if IsBlue:
			velocity.y += gravity 
			if velocity.y > terminal:
				velocity.y = terminal

	move_and_slide()


func _on_timer_timeout() -> void:
	pass # Replace with function body.
