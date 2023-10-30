extends Node2D
var database = PostgreSQLClient.new()

var user = "postgres"
var password = "password"
var host = "localhost"
var port = "5432" #manden i videoen havde de tsom en int men det tror jeg ikke virker
var databaseConnection = "Skrivnavnher"

func _ready():
	database.connect("connection_established",self, "selectFromDB")
	database.connect("connection_error",self,"error")
	database.connect("connection_closed",self,"closedConnection")
	
	database.connect_to_host("postgresql://" + user + ":" + password + "@" + host + ":" + port + "/" + databaseConnection)
	
	pass

func selectFromDB():
	print("running select query")
	
	var data = database.execute("""
	BEGIN;
	SELECT * FROM leaderboard
	""")
	
	for d in data:
		print(data.data_row)
	database.close()

func _process(delta):
	database.poll()
	pass
func closedConnection():
	print("database has closed")

func _exit_tree():
	database.close()
