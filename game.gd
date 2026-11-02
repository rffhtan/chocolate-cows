extends Node2D
var cow = preload("res://cow.tscn")
var dialogue = preload("res://dialogue.tscn")
var instancenum : int = 1
var cow_count : int
var cowprops : Dictionary
var found = false
var breedingcow
@onready var inicow = $cow
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inicow.tag = 0
	add_child(dialogue.instantiate())
	for i in 0 :
		clone("adulthood", Vector2(randi_range(300,1000),randi_range(100,550)), "MM")
	randomize()
	

func clone(stage, pos : Vector2, genotype):
	var instance = cow.instantiate()
	instance.stage = stage
	instance.tag = instancenum
	instance.position = pos
	add_child(instance)
	#instance.breeded.connect(_breeding_done)
	instancenum += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cow_count = get_child_count() - 2
	if (Input.is_action_just_pressed("ui_accept")) and cow_count <= 30 :
		clone("adulthood", Vector2(randi_range(300,1000),randi_range(100,550)), "MM")
	print(cowprops.values())
	breedingcow = _find_state_cow("breeding")
 
func _find_state_cow(target) :
	for i in cowprops.size():
		if  ((cowprops[i])[0]) == target :
			return key


func _breeding_done() :
	print(get_child(breedingcow+1).state)
	get_child(breedingcow+1).state = "active"
