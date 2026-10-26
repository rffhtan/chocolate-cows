extends CanvasLayer
@onready var engine = get_node("/root/game/Dialogue_Engine")
@onready var manager = get_parent().get_node("/root/game/Dialogue_Engine/script_manager")
@export var props: DialogueProperties

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	if is_instance_valid(engine):
		engine.dialogue_started.connect(_dialogue)
	
func _dialogue():
	show()
	
func _process(delta: float) -> void:
	if dialogueid.dialogueid == 3 :
		hide()
	pass
