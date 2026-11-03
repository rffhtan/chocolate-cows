extends Sprite2D
@onready var cow = get_parent() 
var MM = preload("res://assets/cow.png") 
var Mc = preload("res://assets/chocolatecow.png")
var Ms = preload("res://assets/strawberrycow.png")
var Mt = preload("res://assets/milkteacow.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if cow.genotype == "MM" : 
		texture = MM
	elif cow.genotype == "Mc" : 
		texture = Mc
	elif cow.genotype == "Ms" : 
		texture = Ms
	elif cow.genotype == "Mt" : 
		texture = Mt
	region_rect = Rect2(737.943, 873.869, 1008.988, 777.946) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cow.genotype == "MM" : 
		texture = MM
	elif cow.genotype == "Mc" : 
		texture = Mc
	elif cow.genotype == "Ms" : 
		texture = Ms
	elif cow.genotype == "Mt" : 
		texture = Mt
