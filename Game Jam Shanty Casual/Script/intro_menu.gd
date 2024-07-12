extends Control


func _ready():
	$MarginContainer/VBoxContainer/Start.grab_focus()
	


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")
	AudioManager.TitleMusic.stop()
	pass # Replace with function body.


func _on_credit_pressed():
	get_tree().change_scene_to_file("res://Scene/credit.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.





