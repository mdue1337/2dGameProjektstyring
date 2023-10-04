extends Node2D

func _on_StartLevel_pressed():
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")

func _on_Settings_pressed():
	get_tree().change_scene("res://Scenes/Rules.tscn")
