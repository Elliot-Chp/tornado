extends Node

var OrbHP = 230

var OrbAT = 1000

var OrbDF = 2

@export var PlayerStats : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerStats.PlayerDamageOutput = OrbAT
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
