extends Node2D
var cow = preload("res://cow.tscn")
var dialogue = preload("res://dialogue.tscn")
var instancenum : int
var cow_count : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(dialogue.instantiate())
	for i in 1 :
		clone("adulthood", Vector2(randi_range(300,1000),randi_range(100,550)))
	randomize()
	pass # Replace with function body.

func clone(stage, pos : Vector2):
	var instance = cow.instantiate()
	instance.stage = stage
	instance.position = pos
	add_child(instance)
	instancenum += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	cow_count = get_child_count() - 2
	if (Input.is_action_just_pressed("ui_accept")) and cow_count <= 30 :
		clone("adulthood", Vector2(randi_range(300,1000),randi_range(100,550)))
	
