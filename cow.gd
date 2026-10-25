extends CharacterBody2D
@export var state = "active"
@export var speed = 150
var timervar = 0
var directionvar = 1



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	position = Vector2(randf_range(23,1125),randf_range(0,650))
	scale.x = 0.145
	scale.y = 0.145
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
				speed = 80
				scale.x = -0.145
				directionvar = -1
			elif (randi_range(0,10)) == 2 :
				speed = 80
				scale.x = 0.145
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
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity.bounce(collision_info.get_normal())
		velocity = velocity.normalized() * speed
	rotation = 0
