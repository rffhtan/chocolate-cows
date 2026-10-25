extends CanvasLayer
@onready var engine = get_node("/root/Dialogue_Engine")
@export var props: DialogueProperties

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	if is_instance_valid(engine):
		engine.dialogue_started.connect(_dialogue)
	
func _dialogue():
	show()
	
func _process(delta: float) -> void:
	pass
