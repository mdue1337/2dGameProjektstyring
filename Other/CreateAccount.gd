extends Control

func _on_CreateAccountButton_pressed():
	#Der er en eller anden node et eller andet sted som også er connected til CreateAccountButton og bare skriver account created succesfully jeg ved ikke hvorfor og jeg har ikke tænkt mig at fikse det
	
	var username_input = get_owner().get_node("NinePatchRect/VBoxContainer/UserName")
	var password_input = get_owner().get_node("NinePatchRect/VBoxContainer/Password")
	var email_input = get_owner().get_node("NinePatchRect/VBoxContainer/Email")
	
	if username_input.text != "" and password_input.text != "" and "@" in email_input.text:
		print("CreateAccount.gd - attempting to create user")
		Gs.fullname = username_input.text
		print("Username set to")
		print(Gs.fullname)
		Gs.password = password_input.text
		print("Password set to")
		print(Gs.password)
		Gs.email = email_input.text
		print("Email set to")
		print(Gs.email)
		
		var dbScript = preload("res://Scenes/SelectFromDB.gd")
		var dbScriptInstance = dbScript.new()
		dbScriptInstance.insertDBUser()
		
		print("CreateAccount.gd - AccountCreation code has been run")
	else:
		print("Please provide valid username, password and email")
