extends CharacterBody2D
@export var state = "active"
@export var speed = 150
@onready var detect = $Area2D 
@onready var menu = $PopupMenu
@onready var display = $Sprite2D
var target_position: Vector2
var timervar = 0
var directionvar = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	position = Vector2(randi_range(300,1000),randi_range(100,550))
	scale.x = 0.145
	scale.y = 0.145
	pass # Replace with function body.
	detect.cow_clicked.connect(_clicked)
	menu.id_pressed.connect( _on_id_pressed)

func _clicked() :
	state = "clicked"
	menu.popup(Rect2i(self.position.x, self.position.y, 100, 100))

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
			speed = 0
		elif menu.visible == false :
			speed = 150
			state = "active"

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
# on click behaviors 
#breed
func _on_id_pressed(id : int):
		if id == 0 :
			state = "breeding"
		if id == 1 :
			state = "eating"
		if id == 2 :
			state = "following"

#feed
#lead 
