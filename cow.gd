extends CharacterBody2D
@export var state = "active"
@export var speed = 150
@export var stage : String
@onready var detect = $Area2D 
@onready var menu = $PopupMenu
@onready var display = $Sprite2D
@onready var dialogue = get_node("/root/game/Dialogue_Engine")
@onready var game = get_parent()
var target_position: Vector2
var timervar = 0
var directionvar = 1
var tag : int 
var genotype : String 
var phenotype : String 
var gengen
var phephe
signal breeding
signal breeded
signal feeding

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if tag != 0 :
		game.cowprops[tag-1] =  [state, Vector2(position.x, position.y)]
	if stage == "calfhood" :
		scale.x = 0.125
		scale.y = 0.125
	elif stage == "adulthood" :
		scale.x = 0.25
		scale.y = 0.25
	randomize()
	pass # Replace with function body.
	detect.cow_clicked.connect(_clicked)
	menu.id_pressed.connect( _on_id_pressed)
	menu.focus_exited.connect(_on_popup_menu_close_requested)
	var dialogue_engine = get_node("../Dialogue_Engine")
	dialogue_engine.connect_cow(self)
	

func _find_child_genotype():
	if randi_range(1,4) == 1:
		gengen = (bb.parentgenotypes[0].substr(0,1) + bb.parentgenotypes[1].substr(0,1))
	elif randi_range(1,4) == 2:
		gengen = (bb.parentgenotypes[0].substr(0,1) + bb.parentgenotypes[1].substr(1,1))
	elif randi_range(1,4) == 3:
		gengen = (bb.parentgenotypes[0].substr(1,1) + bb.parentgenotypes[1].substr(0,1))
	elif randi_range(1,4) == 4:
		gengen = (bb.parentgenotypes[0].substr(1,1) + bb.parentgenotypes[1].substr(1,1))
func _convert_to_phenotype(geno) :
	if geno.contains("M") :
		phenotype = "MM"

func _clicked():
	if mouse.mousestate == "breed":
		if stage != "calfhood" and state != "clicked" and state != "breeding":
			bb.parentgenotypes[1] = genotype
			_find_child_genotype()
			print(gengen)
			_convert_to_phenotype(gengen)
			game.clone("calfhood", Vector2(position.x, position.y), gengen)
			state = "active"
			dialogueid.dialogueid = 3
			mouse.mousestate = "menu"
			c.choiceselected = false
			breeded.emit()
		return

	state = "clicked"
	if stage != "calfhood" and mouse.mousestate == "menu":
		menu.popup(Rect2i(position.x, position.y, 100, 100))
 
func _process(delta: float) -> void:
#active (as in idle) behaviors
	if state == "active" :
		if not timervar == 20:
			if directionvar == -1 :
				position.x += speed * delta
			if directionvar == 1 :
				position.x -= speed * delta 
			timervar += 1
			await get_tree().create_timer(1).timeout
		if timervar == 20 :
			timervar = 0
			if (randi_range(0,10)) == 1 :
				speed = 150
				display.scale.x = -1 
				directionvar = -1
			elif (randi_range(0,10)) == 2 :
				speed = 150
				display.scale.x = 1
				directionvar = 1
			elif (randi_range(0,10)) == 3 :
				speed = 0
			elif (randi_range(0,10)) == 4 :
				rotation = 60
				for i in range(12) :
					speed = 0
					rotation += 30 * delta
					await get_tree().create_timer(0.01).timeout
				rotation = 0
				timervar = 20
			elif (randi_range(0,10)) == 5 :
				pass
		if tag != 0 :
			game.cowprops[tag-1] =  [state, Vector2(position.x, position.y)]

# bouncing off walls script
	if self.position.x >= 1100 : 
		state = "bounce"
		display.scale.x = 1
		directionvar = 1
		speed = 150
		state = "active"
	if self.position.x <= 100 : 
		state = "bounce"
		display.scale.x = -1
		directionvar = -1
		speed = 150
		state = "active"

	if state == "clicked" :
		if menu.visible :
			mouse.mousestate = "menuclicked"
			speed = 0

	if state == "following":
		speed = 150
		if Input.is_action_just_pressed("mouse_leftclick"):
			target_position = get_global_mouse_position()
			state = "moving_to_target"

	if state == "moving_to_target":
		position.x = move_toward(
		position.x,
		target_position.x,
		speed * delta
		)
		position.y = move_toward(
		position.y,
		target_position.y,
		speed * delta
		)
		if target_position.x > position.x :
			display.scale.x = -1 
		if target_position.x < position.x :
			display.scale.x = 1 
		if abs(position.y - target_position.y) < 1 and  abs(position.x - target_position.x) < 1:
			await get_tree().create_timer(1).timeout
			state = "active"
			c.choiceselected = false;

	if dialogueid.dialogueid == 3:
		state = "active"
		mouse.mousestate = "menu"

	if state == "eating" :
		if dialogueid.dialogueid == 5 :
			genotype = "Mc"
			state = "active"
			dialogueid.dialogueid = 3
		if dialogueid.dialogueid == 6 :
			genotype = "Ms"
			state = "active"
			dialogueid.dialogueid = 3
		if dialogueid.dialogueid == 7 :
			genotype = "Mt"
			state = "active"
			dialogueid.dialogueid = 3


# on click behaviors 
#breed
func _on_id_pressed(id : int):
	mouse.mousestate = "menu"
	c.choiceselected = true
	if id == 0 :
		state = "breeding"
		bb.parentgenotypes[0] = genotype
		mouse.mousestate = "breed"
		breeding.emit()

	if id == 1 :
		state = "eating"
		feeding.emit()

	if id == 2 :
		dialogueid.dialogueid = 0
		state = "following"

#feed
#lead 

func _on_popup_menu_close_requested() -> void: 
	if state == "clicked" and c.choiceselected == false:
		state = "active"
		mouse.mousestate = "menu"
