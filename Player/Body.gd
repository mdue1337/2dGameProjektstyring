extends KinematicBody2D

const Speed = 1000

var motion = Vector2()
func _ready():
	Gs.connect("extraHealth", self, "scoreToHealth")

	
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
	scoreToHealth()
	
func scoreToHealth():
	if Gs.chestCounter % 3 == 0 && Gs.chestCounter > 0:
		Gs.health = Gs.health + 1
		Gs.emit_signal("extraHealth",Gs.health)
		print(Gs.health)
	
	
	



