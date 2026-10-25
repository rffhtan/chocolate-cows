extends RichTextLabel
@onready var engine = get_node("/root/Dialogue_Engine")
@export var props = load("res://dialogueresources.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	if is_instance_valid(engine):
		engine.dialogue_started.connect(_dialogue)
	
func _dialogue():
	show()
	text = props.diascript


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
