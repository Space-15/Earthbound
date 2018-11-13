extends "res://Scripts/Engine/Entity.gd"

const SPEED = 250
const TYPE = "PLAYER"

onready var health = $Health
onready var oxygen = $Oxygen

var keys = 0
var idle = true

func _ready():
	Global.Player = self 
	
func get_health_node():
	return $Health	
	
func get_oxygen_node():
	return $Oxygen
	
func take_damage(damage):
	health.take_damage(damage)
	
func lose_oxygen(oxygen):
	oxygen.lose_oxygen(oxygen)
	
func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	#damage_loop()
	keys = min(keys, 9)
	
	if movedir != dir.center:
		idle = false;
		anim_switch("walk")
	elif idle == false:
		idle = true
		anim_switch("idle")
	if Input.is_action_just_pressed("a") and idle == true:
		anim_switch("attack")
		
func controls_loop():
	var LEFT	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP	    = Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	var x = 0
	var y = 0
	if movedir.y == 0:
		movedir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if movedir.x == 0:
		movedir.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		
	
#	to move in all 8 directions
#	movedir.x = -int(LEFT) + int(RIGHT)
#	movedir.y = -int(UP) + int(DOWN)
	

	
#func spritedir_loop():
#	match  movedir:
#		dir.left:
#			spritedir = "left"
#		dir.right:
#			spritedir = "right"
#		dir.up:
#			spritedir = "up"
#		dir.down:
#			spritedir = "down"
	





