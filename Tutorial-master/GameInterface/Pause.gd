extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
	

func _on_resumeBtn_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state


func _on_menuBtn_pressed():
	get_tree().change_scene("res://MainMenu/title_screen/TitleScreen.tscn")


func _on_saveBtn_pressed():
	pass # replace with function body


func _on_pauseBtn_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
