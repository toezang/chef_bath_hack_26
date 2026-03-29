extends Area2D

var isShowingRecipe = true;

@onready var recipeBody = $orderCollisionShape/body
@onready var recipeTitle = $orderCollisionShape/title

var title = ""

var ingredients = ""

var instructions = ""

var outcome = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("created!")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_order(title: String, ingredients: String, instructions: String) -> void:
	title = title
	ingredients = ingredients
	instructions = instructions
	recipeTitle.text = title
	recipeBody.text = ingredients + instructions

func switch_sides() -> void:
	if isShowingRecipe:
		recipeBody.text = ingredients + instructions
	else:
		recipeBody = outcome
