class_name DialogueProperties
extends Resource

@export var diacharacter: String
@export var diascript: String
@export var diamod: String
@export var diaconditions: Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	diacharacter
	diascript 
	diamod 
	diaconditions 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
