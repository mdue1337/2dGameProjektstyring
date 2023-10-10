extends Node2D

func _ready():
	Gs.health = 3
	update_label(Gs.health)
	Gs.connect("updateHealth", self, "update_label")

func update_label(healthCount):
	$Label.text = "Health: " + str(healthCount)
