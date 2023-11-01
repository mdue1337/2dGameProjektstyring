extends Node2D
var database := PostgreSQLClient.new()

var user = "xubugyyg"
var password = "zMUTlOkEi6EOCjPVyMBbwbkE_c6wpElq"
var host = "flora.db.elephantsql.com"
var port = 5432 #manden i videoen havde de tsom en int men det tror jeg ikke virker
var databaseConnection = "xubugyyg"

func _ready():
	database.connect("connection_established",self, "selectFromDB")
	database.connect("connection_error",self,"error")
	database.connect("connection_closed",self,"closedConnection")
	
	print("Attempting to connect")
	database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [user, password, host, port, databaseConnection])
		
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

func selectFromDB():
	print("running select query")
	
	var data = database.execute("""
	BEGIN;
	SELECT * FROM leaderboard;
	""")
	
	for d in data:
		print(data)
	database.close()

func _process(delta):
	database.poll()
	pass

func closedConnection():
	print("database has closed")

func _exit_tree():
	database.close()
