extends Node2D

func set_text():
	var count = Gs.chestCounter
	$Label.text = "Chests: " + str(count)
