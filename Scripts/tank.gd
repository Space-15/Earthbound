extends Area2D

func _ready():
	connect("body_entered",self,"body_entered")

	
func body_entered(body):
	if body.name == "player":
		queue_free()		
		Global.Player.gain_o2(20)
		

		

