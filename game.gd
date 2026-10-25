extends Node2D
var cow = preload("res://cow.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready")
	clone()
	randomize()
	pass # Replace with function body.

func clone():
	print("start")
	var instance = cow.instantiate()
	add_child(instance)
	var instance2 = cow.instantiate()
	add_child(instance2)
	var instance3 = cow.instantiate()
	add_child(instance3)
	var instance4 = cow.instantiate()
	add_child(instance4)
	print("Cow count: ", get_child_count())
	print("Cow 1: ", instance.position)
	print("Cow 2: ", instance2.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
