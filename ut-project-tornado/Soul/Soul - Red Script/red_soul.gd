extends CharacterBody2D

@export var SoulSpeed = 200
@export var IsBlue = false
@export var IsParry = false
@export var gravity = 2
var BlueSoulJump = 200
var BlueSoulGravity = 200 
@export var velo_timer : Timer


const terminal : float = 650.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func get_input(_delta):
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	var BlueSoulDir = Input.get_axis("Left", "Right")
	if IsBlue == false:
		velocity = dir * SoulSpeed
		
	else: 
		velocity.x = BlueSoulDir * SoulSpeed
		if (Input.is_action_pressed("Up") and is_on_floor()) and velocity.y <= 0:
			velocity.y -= BlueSoulJump
		if Input.is_action_just_released("Up") and velocity.y <= 0:
			# gradually increase y velocity
			for i in range(60):
				velocity.y += (BlueSoulGravity / 60)
				# wait for 1000/60 ms
				velo_timer.start()
	
	
	
	if Input.is_action_pressed("SlowDown"):
		if IsBlue == false:
			velocity = velocity /2
		pass
		
	

		
	
	
	
	





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input(delta)
	move_and_slide()
	
	# If is in the air, gravity is applied
	if !is_on_floor() and IsBlue == true:
		velocity.y += gravity
		if velocity.y > terminal:
			velocity.y = terminal

	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.
