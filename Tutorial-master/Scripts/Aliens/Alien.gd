extends "res://Scripts/Engine/Entity.gd"

const SPEED = 100
const DAMAGE = 1


var movetimer_length = 65
var movetimer = 0

#func _newDirection():
#
#	var rand = randi() % 4 + 1
	
	

		
	
		


func _ready():
	
					
	#$anim.play("default")
	movedir = dir.rand()
	
	
		
			
		
	
	
func _physics_process(delta):
	movement_loop()
	#damage_loop()
	spritedir_loop()
	
	if movedir != dir.center:
		anim_switch("walk")
		
	if movetimer > 0:
		movetimer -=1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length		
	
	
	