extends Node

var TotalCoins = 0
var MaxCoins = 4
var HPMax = 4
var HPTotal = 4

var floormax = 80
var camerafloor =  80

var lvl1MaxCoins = 8
var lvl1cameraright= 1216
var lvl1Complete = false

var lvl2cameraright= 1500
var lvl2MaxCoins = 7
var lvl2Complete = false




var Playerdeath = true

func _process(delta):
	if HPTotal == 0 or Playerdeath == false:
		TotalCoins = 0
		HPTotal = HPMax
		get_tree().reload_current_scene()
		Playerdeath = true
	
	Level1_handler()
	Level2_handler()
	

func Level1_handler():
	
	
	if TotalCoins == lvl1MaxCoins:
		get_tree().change_scene_to_file("res://Scene/level_2.tscn")
		TotalCoins = 0
		HPTotal = HPMax
		lvl1Complete = true
		return

func Level2_handler():
	
	if TotalCoins == lvl2MaxCoins and lvl1Complete == true:
		get_tree().change_scene_to_file("res://Scene/outro_menu.tscn")
		TotalCoins = 0
		HPTotal = HPMax
		lvl1Complete = false
		AudioManager.TitleMusic.play()
	pass
