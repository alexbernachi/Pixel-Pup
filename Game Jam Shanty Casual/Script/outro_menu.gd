extends Control

func _ready():
	$Start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scene/intro_menu.tscn")
	pass # Replace with function body.
