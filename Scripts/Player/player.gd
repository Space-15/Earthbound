extends "res://Scripts/Engine/Entity.gd"


const SPEED = 200
const DAMAGE = 3
const TYPE = "PLAYER"
var idle = true
var keys = 0

var components = 0

onready var health1 = $Health
onready var oxygen = $Oxygen




func _ready():
	Global.Player = self 

func _physics_process(delta):
	controls_loop()
	movement_loop()
	damage_loop()
	spritedir_loop()
	
	
	
	
	
	
	
	
	
	 
	
	keys = min(keys, 9)
	
	if movedir != Vector2(0,0):
		idle = false;
		anim_switch("walk")
	elif idle == false:
		idle = true
		anim_switch("idle")
	if Input.is_action_just_pressed("a") and idle == true:
		anim_switch("attack")
	
	if Input.is_action_just_pressed("a"):
		use_item(preload("res://sword.tscn"))
		anim_switch("attack")
		var hitPlayer = AudioStreamPlayer.new()
		self.add_child(hitPlayer)
		hitPlayer.stream  = load("res://soundscrate-lightsword-fast-swing-1.wav")
		hitPlayer.play()
		
	if Input.is_action_just_pressed("y"):
		take_damage(50)
		
			



		

func take_damage(damage):
	damage_sound()
	health1.take_damage(damage)
	
func lose_oxygen(atm):
	oxygen.lose_oxygen(atm)
	
func heal_lp(life):
	_foodpickupSFX()
	health1.heal(life)		
	
func gain_o2(gain):
	_pickupSFX()
	oxygen.gain_oxygen(gain)	
	
func lose_o2():
	lose_oxygen(2)
	
func add_component():
	_pickupSFX()
	components+=1	
	
	
		

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

func _on_Timer_timeout():
	lose_o2()

func _pickupSFX():
	var pickupPlayer = AudioStreamPlayer.new()
	self.add_child(pickupPlayer)
	pickupPlayer.stream  = load("res://SoundsCrate-SciFi-Laser2.wav")
	pickupPlayer.play()

func _foodpickupSFX():
	var pickupPlayer = AudioStreamPlayer.new()
	self.add_child(pickupPlayer)
	pickupPlayer.stream  = load("res://Map/World1/WorldMaps/soundscrate-old-camera-sounds-1.wav")
	pickupPlayer.play()
