extends AnimatedSprite


func _ready():

	if Input.is_action_pressed("Left"):
		play("Venstre")

	elif Input.is_action_pressed("Up"):
		play("Op")

	elif Input.is_action_pressed("Down"):
			play("Ned")
	
	else:
		play("Højre")
