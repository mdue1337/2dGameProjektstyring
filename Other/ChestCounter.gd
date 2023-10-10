extends Node2D

func _ready():
	_on_chest_count_changed(Gs.chestCounter)
	Gs.connect("updateCounter", self, "_on_chest_count_changed")

func _on_chest_count_changed(count):
	$Label.text = "Chests: " + str(count)
