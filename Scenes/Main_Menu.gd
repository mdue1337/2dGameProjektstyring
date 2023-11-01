extends Node2D
onready var username_input = get_node("CreateAccount2/NinePatchRect/VBoxContainer/UserName")
onready var password_input = get_node("CreateAccount2/NinePatchRect/VBoxContainer/Password")
onready var email_input = get_node("CreateAccount2/NinePatchRect/VBoxContainer/Email")

func _ready():
	$ColorRect/StartLevel.connect("pressed", self, "_on_StartLevel_pressed")
	$ColorRect/Settings.connect("pressed", self, "_on_Settings_pressed")

func _on_StartLevel_pressed():
	print(1)
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_Settings_pressed():
	print(2)
	get_tree().change_scene("res://Scenes/Rules.tscn")


func _on_Login_pressed():
	get_node("LoginScreen2").visible = true


func _on_CreateAccountButton_pressed():
	if username_input.text != "" and password_input.text != "" and "@" in email_input.text:
		print("Account created succesfully")
	else:
		print("Please provide valid username, password and email")


func _on_LoginButton_pressed():
	get_node("LoginScreen2").visible = true
	get_node("CreateAccount2").visible = false

func _on_Login_LoginButton_pressed():
	if username_input.text != "" and password_input.text != (""):
		print("Login Succesfull")
		get_node("LoginScreen2").visible = false
	else:
		print("Incorrect Username or Password")


func _on_Login_CreateAccountButton_pressed():
	get_node("LoginScreen2").visible = false
	get_node("CreateAccount2").visible = true


