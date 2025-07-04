extends Node

var PlayerEXP = 0

var PlaverLV = 1 

# Hp calulated 16 + (4 * LV)
var PlayerHpData = 20

var PlayerHp = 20

var PlayerAt = 10

var PlayerDf = 10

@export var PlayerSoulSpeed = 200

@export var OrbStats : Node

# 30 for 30 fps i think
var PlayerInv = 60 

var PlayerWpAt

var PlayerArDf = 10

var SoulSpeed

var PlayerDamageOutput 

var PlayerDamageTaken 



# “round((Weapon ATK + ATK - Monster DEF + r) * b)  r is a random value and b is the fight bar value

func PlayerLevelUp():
	PlayerHpStats()

func PlayerHpStats():
	# How undertale does Hp
	#PlayerHp = PlayerHpData + (4 * PlaverLV)
	
	pass
	
	#damage taken = (damage output - defense / 5), with a minimum damage of 1
	
func PlayerAtStats():
	
	pass
	
	
func TakingDamageCalculation():
	PlayerDamageOutput = TrashOrbStats.OrbAT 
	PlayerDamageTaken = clampi((PlayerDamageOutput - (PlayerDf + PlayerArDf) /5), 1, 999)
	if Input.is_action_just_pressed("Cancel"):
		PlayerHpData = PlayerHpData - PlayerDamageTaken

func TakingDamage():
	PlayerHp = clampi(PlayerHpData,0 ,PlayerHpData)
	print(PlayerHp)




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#PlayerHpStats()
	pass

	#remove later testing code


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	TakingDamageCalculation()
	TakingDamage()
	pass
