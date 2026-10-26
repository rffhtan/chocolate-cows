extends Node2D
var cow = preload("res://cow.tscn")
var dialogue = preload("res://dialogue.tscn")
var instancenum : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 1 :
		clone()
	randomize()
	pass # Replace with function body.

func clone():
	var instance = cow.instantiate()
	add_child(instance)
	instancenum += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept")) :
		clone()
	
