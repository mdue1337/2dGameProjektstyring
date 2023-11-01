extends Node2D

func _ready():
	$ColorRect/StartLevel.connect("pressed", self, "_on_StartLevel_pressed")
	$ColorRect/Settings.connect("pressed", self, "_on_Settings_pressed")

func _on_StartLevel_pressed():
	print(1)
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_Settings_pressed():
	print(2)
	get_tree().change_scene("res://Scenes/Rules.tscn")
