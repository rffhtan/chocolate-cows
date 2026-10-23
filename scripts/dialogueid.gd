extends Node
@onready var engine = get_node("/root/Dialogue_Engine")
@export var dialogueid: int = 1
var properties: DialogueProperties = preload("res://dialogueresources.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
