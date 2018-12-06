extends "res://Scripts/Engine/Entity.gd"

const SPEED = 40
const DAMAGE = 5
#var health = 30


var movetimer_length = 100
var movetimer = 0


func _ready():
	movedir = dir.rand()
	
func take_damage(damage):
	health-=damage
	
	
func _physics_process(delta):
	movement_loop()
	spritedir_loop()
	damage_loop()
	
	
	if movedir != dir.center:
		anim_switch("walk")
		
	if movetimer > 0:
		movetimer -=1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length		
	
	
	