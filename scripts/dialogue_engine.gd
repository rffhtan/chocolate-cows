extends Control
@onready var dialoguebox = $dialoguebox
@onready var panel = get_node("dialoguebox/panel")
@export var props = load("res://dialogueresources.tres")

signal dialogue_started()
signal line_displayed 
signal choices_presented
signal dialogue_ended
var dialogueongoing = false
var previousdiaid = 255

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogueid.dialogueid = 1
	pass # Replace with function body.

func dialogue() -> void:
	if not previousdiaid == dialogueid.dialogueid:
		previousdiaid = dialogueid.dialogueid
	dialogueongoing = true
	dialogue_started.emit()
	choices_presented.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#disabled buddy
	#if (Input.is_action_pressed("ui_accept") or dialogueongoing == true) and not previousdiaid == dialogueid.dialogueid :
		#dialogue()
