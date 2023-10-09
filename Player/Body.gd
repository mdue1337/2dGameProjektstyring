extends KinematicBody2D

const Speed = 500

var motion = Vector2()

func _physics_process(delta):
	motion = Vector2()  # Reset the motion vector at the start of each frame

	if Input.is_action_pressed("Right"):
		motion.x += Speed
		get_node("AnimatedSprite").set_flip_h(true)
	elif Input.is_action_pressed("Left"):
		motion.x -= Speed
		get_node("AnimatedSprite").set_flip_h(false)

	if Input.is_action_pressed("Up"):
		motion.y -= Speed
	elif Input.is_action_pressed("Down"):
		motion.y += Speed

	motion = move_and_slide(motion)




