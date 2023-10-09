extends AnimatedSprite

func _ready():
	pass
	
	
	
func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		play("Venstre")
	elif Input.is_action_pressed("Left"):
		play("Venstre")
	elif Input.is_action_pressed("Up"):	
		play("Op")
	elif Input.is_action_pressed("Down"):
		play("Ned")
