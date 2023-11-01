extends Control
onready var username_input = get_node("CreateAccount2/NinePatchRect/VBoxContainer/UserName")
onready var password_input = get_node("CreateAccount2/NinePatchRect/VBoxContainer/Password")
onready var email_input = get_node("CreateAccount2/NinePatchRect/VBoxContainer/Email")


func _on_CreateAccountButton_pressed():
	if username_input.text != "" and password_input.text != "" and "@" in email_input.text:
		print("Account created succesfully")
	else:
		print("Please provide valid username, password and email")
