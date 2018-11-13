extends KinematicBody2D

const SPEED = 0
const TYPE = "ENEMY"

var movedir = dir.center
var spritedir = ("down")
var hitstun = 0
var knockdir = dir.center


func movement_loop():
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * SPEED
	else:
		motion = knockdir.normalized() * SPEED *125
	move_and_slide(motion, dir.center)
	

	
func spritedir_loop():
	match movedir:
		dir.left:
			spritedir = "left"
		dir.right:
			spritedir = "right"	
		dir.up:
			spritedir = "up"			
		dir.down:
			spritedir = "down"
				
				
func anim_switch(animation):
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim) 
				
		
				
#func damage_loop():
#	if hitstun > 0:
#		hitstun -= 1
#		for body in $hitbox.get_overlapping_bodies():
#			if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
#				health -= body.get("DAMAGE")
#				hitstun = 10
#				knockdir = transform.origin - body.transform.origin	
	
	

