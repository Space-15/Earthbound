extends Node

signal health_changed(new_health)
#signal damage_taken(new_health)

var health = 0
export(int) var max_health = 100 

func _ready():
	Global.Health = self
	health =  max_health
	emit_signal("health_changed", health)
	
func set_maximum(value):
	max_health = max(0,value)
	
func take_damage(amount):
	health -=amount
	health = max(0,health)
	emit_signal("health_changed", health)
	emit_signal("damage_taken",health)
	
	if health == 0:
		emit_signal("health_depleted")
		
func heal(amount):
	health+=amount
	health = max(health, max_health)
	emit_signal("health_changed", health)				