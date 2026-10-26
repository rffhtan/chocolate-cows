extends Node
@onready var engine = get_node("/root/game/Dialogue_Engine")
@export var props = load("res://dialogueresources.tres")
var options : Array 
var options2 : Array
var d = {1 : ["Press another cow to breed this one with. (UNFINISHED)"], 2 : ["Choose a food to feed this cow. (UNFINISHED)"]}
var o = {1 : ["Close."], 2 : ["Close."]}
var o2 = { 1 : [3], 2 : [3]}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_instance_valid(engine):
		engine.dialogue_started.connect(_dialogue)
		engine.choices_presented.connect(_options)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _dialogue():
	if  d.has(dialogueid.dialogueid) :
		props.diascript = ((d[dialogueid.dialogueid])[0])
	if is_instance_valid(props.diacharacter) :
		props.diacharacter = (d[dialogueid.dialogueid])[1]
	if is_instance_valid(props.diamod) :
			props.diamod = ((d[dialogueid.dialogueid])[2])

func _options():
	if o.has(dialogueid.dialogueid) :
		options = ((o[dialogueid.dialogueid]))
	if o2.has(dialogueid.dialogueid) :
		options2 = ((o2[dialogueid.dialogueid]))
