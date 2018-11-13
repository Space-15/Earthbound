extends KinematicBody2D

const SPEED = 300
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true 
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_down"):
		motion.y = SPEED
		$Sprite.play("walkdown")
	elif Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
		$Sprite.play("walkup")
	else:
		motion.x = 0
		motion.y = 0
		$Sprite.play("idle")

	move_and_slide(motion, RESISTANCE)

