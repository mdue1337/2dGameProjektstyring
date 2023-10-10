extends KinematicBody2D

const Speed = 500

var motion = Vector2()

func _physics_process(delta):
	motion = Vector2()  # Reset the motion vector at the start of each frame

	if Input.is_action_pressed("Right"):
		motion.x += Speed
		get_node("CollisionDown").disabled = true
		get_node("CollisionUp").disabled = true
		get_node("CollisionLeft").disabled = false
	
		get_node("AnimatedSprite").set_flip_h(true)
	elif Input.is_action_pressed("Left"):
		motion.x -= Speed
		get_node("CollisionDown").disabled = true
		get_node("CollisionUp").disabled = true
		get_node("CollisionLeft").disabled = false
	
		get_node("AnimatedSprite").set_flip_h(false)

	if Input.is_action_pressed("Up"):
		motion.y -= Speed
		get_node("CollisionDown").disabled = true
		get_node("CollisionUp").disabled = false
		get_node("CollisionLeft").disabled = true
	elif Input.is_action_pressed("Down"):
		motion.y += Speed
		get_node("CollisionDown").disabled = false
		get_node("CollisionUp").disabled = true
		get_node("CollisionLeft").disabled = true

	motion = move_and_slide(motion)

func GetChest():
	Gs.chestCounter += 1
	$AudioStreamPlayer.play()
	
	#timer
	var t = Timer.new()
	t.set_wait_time(0.96)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	#stop
	$AudioStreamPlayer.stop()
	
	#timer slut
	t.queue_free()



