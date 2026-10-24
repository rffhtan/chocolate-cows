extends Node2D
var cow = preload("res://cow.tscn").instance()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	add_child(cow)
	cow.position = Vector2(900,-500)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
