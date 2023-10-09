extends Area2D

func _on_Chest_body_entered(body):
	if body.has_method("GetChest"):
		body.GetChest()
		print(Gs.chestCounter)
		Gs.emit_signal("updateCounter", Gs.chestCounter)
		queue_free()
