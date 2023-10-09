extends KinematicBody2D

const Speed = 500

var motion = Vector2()
	
func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		motion.x = Speed
	elif Input.is_action_pressed("Left"):
		motion.x = -Speed
	elif Input.is_action_pressed("Up"):
		motion.y = -Speed
	elif Input.is_action_pressed("Down"):
		motion.y = +Speed
	else:
		motion.x = 0
		motion.y = 0
	
	motion = move_and_slide(motion)

func getChest():
	
