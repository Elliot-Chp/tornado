extends GPUParticles2D

var emit = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func InputPreesed():
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	if dir:
		set_deferred("emitting", true)


func FadeOut(delta):
	if amount != 0:
		modulate.a = 1 - .5
	if amount == 0:
		modulate.a = 1
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	InputPreesed()
	FadeOut(delta)
	
