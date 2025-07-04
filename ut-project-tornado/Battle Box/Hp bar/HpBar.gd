extends ProgressBar

@onready var HpBar = $"."


func _process(delta: float) -> void:
	HpBar.value = PlayerStats.PlayerHp
