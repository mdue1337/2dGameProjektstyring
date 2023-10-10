extends Area2D


func _on_Rock_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
		print("damage")
		Gs.emit_signal("updateHealth", Gs.health)
		print("New health" + str(Gs.health))
