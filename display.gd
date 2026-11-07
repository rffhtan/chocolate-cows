extends Sprite2D
@onready var cow = get_parent() 
var cowtextures : Dictionary


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if cow.tag >= 1 :
		cowtextures["MM"] = ("res://assets/cow.png")
		cowtextures["cc"] = ("res://assets/chocolatecow.png")
		cowtextures["ss"] = ("res://assets/strawberrycow.png")
		cowtextures["tt"] = ("res://assets/milkteacow.png")
		if cowtextures.has(cow.genotype) :
			texture = load(cowtextures[cow.genotype])
		else :
			texture = load(cowtextures[cow.phenotype])
	region_rect = Rect2(737.943, 873.869, 1008.988, 777.946) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cow.tag >= 1 :
		if cowtextures.has(cow.genotype) :
			texture = load(cowtextures[cow.genotype])
		else :
			texture = load(cowtextures[cow.phenotype])
