extends Node2D


# Declare member variables here. Examples:
var chest = preload("res://Models/Chest.tscn")
var xvalue
var yvalue
var gamma = 1
var rock = preload("res://Models/Rock.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gamma = gamma+1
	if (gamma % Gs.needed_time == 0):
		#Chest delen
		generator()
		var kiste = chest.instance()
		add_child(kiste)
		kiste.position = Vector2(xvalue,yvalue)
		print("Chest spawned")
		
		#Rock delen
		generator()
		var sten = rock.instance()
		add_child(sten)
		sten.position = Vector2(xvalue,yvalue)
		print("Rock spawned")

func generator():
	xvalue = randi() % (2000 - -2000 + 1) + -2000
	yvalue = randi() % (3400 - -3600 + 1) + -3600
