extends Area2D

@onready var recipeTitle = $ticketCollision/title
@onready var recipeBody = $ticketCollision/body

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _changeText(title: String, ingredients: String, instructions: String) -> void:
	recipeTitle.text = title
	recipeBody.text = ingredients + instructions
	
	
