extends Node2D
var database := PostgreSQLClient.new()

var user = "xubugyyg"
var password = "zMUTlOkEi6EOCjPVyMBbwbkE_c6wpElq"
var host = "flora.db.elephantsql.com"
var port = 5432 #manden i videoen havde de tsom en int men det tror jeg ikke virker
var databaseConnection = "xubugyyg"

func _ready():
	database.connect("connection_established",self, "VerifyLogin")
	database.connect("connection_error",self,"error")
	database.connect("connection_closed",self,"closedConnection")
	
	database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [user, password, host, port, databaseConnection])
	pass

func selectUserFromDB():
	print("running select query")
	
	var data = database.execute("SELECT * FROM public.\"Users\";")
	
	for i in range(data.size()):
		for d in data[i].data_row:
			print(str(d))
	
	database.close()

func insertDBUser():
	print("Insert")
	var fullname = Gs.fullname
	var email = Gs.email
	var password = Gs.password
	
	var query = "BEGIN;\n"
	query += "INSERT INTO public.\"Users\" (fullname, email, passwordtext) VALUES ('" + fullname + "', '" + email + "', '" + password + "');\n"
	query += "COMMIT;"
	
	database.execute(query)
	database.close()

func VerifyLogin():
	var email = Gs.loginEmail
	var pw = Gs.loginPw
	
	var query = "SELECT COUNT(*) FROM public.\"Users\" WHERE email = '" + str(email) + "' AND passwordtext = '" + str(pw) + "'"
	
	var data = database.execute(query)
	
	if data[0].data_row[0][0] == 1:
		print("login win")
		Gs.loginsucess = true
	else:
		print("login fail")
		Gs.loginsucess = false
	

func _process(delta):
	database.poll()
	pass

func closedConnection():
	print("database has closed")

func _exit_tree():
	database.close()
