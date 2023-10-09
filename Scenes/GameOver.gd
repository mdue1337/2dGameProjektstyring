extends Node2D

func _ready():
	set_labels()

func set_labels():
	var chestCount = Gs.chestCounter
	$ColorRect/CenterContainer/VBoxContainer/Label.text = "You collected " + str(chestCount) + " chests"

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
