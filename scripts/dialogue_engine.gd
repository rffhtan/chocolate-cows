extends Control
@onready var dialoguebox = $dialoguebox
@onready var panel = get_node("dialoguebox/panel")
@export var props = load("res://dialogueresources.tres")
@onready var cow = get_node("/root/game/cow")

signal dialogue_started()
signal line_displayed 
signal choices_presented
signal dialogue_ended
var dialogueongoing = false
var previousdiaid = 255

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_position(Vector2(150.0,595.0))
	dialogueid.dialogueid = 1
	pass # Replace with function body.
	

func dialogue() -> void:
	if not previousdiaid == dialogueid.dialogueid:
		previousdiaid = dialogueid.dialogueid
	dialogueongoing = true
	dialogue_started.emit()
	choices_presented.emit()

func connect_cow(cow_instance: Node) -> void:
	cow_instance.breeding.connect(_on_cow_breeding)
	cow_instance.feeding.connect(_on_cow_feeding)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_cow_feeding() :
	dialogueid.dialogueid = 2
	dialogue()

func _on_cow_breeding() :
	dialogueid.dialogueid = 1
	dialogue()
