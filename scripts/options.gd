extends Control
@onready var engine = get_node("/root/game/Dialogue_Engine")
@onready var manager = get_node("/root/game/Dialogue_Engine/script_manager")
var dialoguestarted = false
signal key1pressed()
signal key2pressed()
signal key3pressed()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	engine.choices_presented.connect(_options)
	engine.dialogue_started.connect(_dialogue)

func _options():
	show()

	
func _process(delta: float) -> void:
	if dialoguestarted == true :
		if Input.is_action_just_pressed("num1") :
			key1pressed.emit()
		if Input.is_action_just_pressed("num2") :
			key2pressed.emit()
		if Input.is_action_just_pressed("num3") :
			key3pressed.emit()

func _dialogue() :
	dialoguestarted = true



func _on_option_pressed() -> void:
	pass # Replace with function body.
