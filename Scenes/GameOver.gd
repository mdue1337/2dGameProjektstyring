extends Node2D

func _ready():
	set_labels()
	var dbScript = preload("res://Scenes/SelectFromDB.gd")
	var dbScriptInstance = dbScript.new()
	print("GameOver.gd - attempting to log score")
	dbScriptInstance.scoreLogger()

func set_labels():
	var chestCount = Gs.chestCounter
	$ColorRect/CenterContainer/VBoxContainer/Label.text = "You collected " + str(chestCount) + " chests"

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
