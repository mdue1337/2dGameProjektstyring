extends Node2D
var database := PostgreSQLClient.new()

var user = "xubugyyg"
var password = "zMUTlOkEi6EOCjPVyMBbwbkE_c6wpElq"
var host = "flora.db.elephantsql.com"
var port = 5432
var databaseConnection = "xubugyyg"

func _ready():
	database.connect("connection_established",self, "selectUserFromDB")
	database.connect("connection_error",self,"error")
	database.connect("connection_closed",self,"closedConnection")
	
	database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [user, password, host, port, databaseConnection])
	
	print("SelectFromDB.gd - database intialization code run")
	
	pass

func insertIntoDB(id,name,score):
	print("running select query")
	
	var data = database.execute("""
	BEGIN;
	INSERT INTO leaderboard (id,name,score) values (%s, '%s', %s);
	commit;
	""" % [id,name,score])
	
	for d in data[1].data_row:
		print(d)
		
		
	database.close()

#LEGACY CODE! Det her er skrald men jeg gider ikke fjerne det fordi maybe who knows det skader ikke noget at være der der er like maksimum 100 kb ram mere det er fint
func selectFromDB():
	print("running select query")
	
	var data = database.execute("""
	BEGIN;
	SELECT * FROM leaderboard;
	""")
	
	for d in data:
		print(d)
	database.close()

func selectUserFromDB():
	print("running select query")
	
	var data = database.execute("SELECT * FROM public.\"Users\";")
	
	for i in range(data.size()):
		for d in data[i].data_row:
			print(str(d))
	
	database.close()

func insertDBUser():
	print("SelectFromDB.gd - Inserting user into DB")
	var fullname = Gs.fullname
	var email = Gs.email
	var password = Gs.password
	
	var query = "BEGIN;\n"
	query += "INSERT INTO public.\"Users\" (fullname, email, passwordtext) VALUES ('" + fullname + "', '" + email + "', '" + password + "');\n"
	query += "COMMIT;"
	
	database.execute(query)
	database.close()

func VerifyLogin():
	var email = Gs.loginemail
	var pw = Gs.loginpw
	print(str(pw))
	print(str(email))
	
	var query = "SELECT * FROM public.\"Users\" WHERE email = '" + str(email) + "' AND passwordtext = '" + str(pw) + "'"
	
	var data = database.execute(query)
	
	var num = data.size()
	print(num)
	
	if data[0].data_row[0][0] == 1:
		print("login win")
		Gs.loginsucess = true
		
		print("updating userID...")
		var query2 = "SELECT * FROM public.\"Users\" WHERE email = '" + str(email) + "' AND passwordtext = '" + str(pw) + "'"
		var data2 = database.execute(query2)
		Gs.userid = data2[0].data_row[0][0]
		print("userID updated to:")
		print(Gs.userid)
		
	else:
		print("login fail")
		Gs.loginsucess = false
	
	database.close()


func scoreLogger():
	if(Gs.userid==92233720368547750):
		print("Ingen User logged ind")
		pass
	
	var userid = Gs.userid
	var score = Gs.chestCounter
	print("SelectFromDB.gd - Score:" + str(score))
	print(Gs.chestCounter)
	
	var query2 = "BEGIN;\n"
	query2 += "INSERT INTO public.\"Scores\" (userid, score) VALUES ('" + str(userid) + "', '" + str(score) + "');\n"
	query2 += "COMMIT;"
	database.execute(query2)
	
	database.close()

func _process(delta):
	database.poll()
	pass

func closedConnection():
	print("database has closed")

func _exit_tree():
	database.close()
