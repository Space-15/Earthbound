extends Node2D

func _ready():
	Global.GameState = self


func changeMap():
	tree_entered().change_scene("res://Map/Tutorial/Map1.tscn")