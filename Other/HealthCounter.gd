extends Node2D

func _ready():
	update_label()

func take_damage():
	Gs.health = Gs.health - 1
	check_if_dead()

func check_if_dead():
	if Gs.health <= 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")

func update_label():
	$Label.text = "Health: " + str(Gs.health)
