extends Sprite2D


var ingredients = [];

var instructions = [];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _add_ingredient(ingredient: String) -> void:
	ingredients.append(ingredient)
	print("added ingredient! ingredients in bowl:")
	print(ingredients)

func add_instruction(instruction: String) -> void:
	instructions.append(instruction)
	print("did instricution! instructios so far:")
	print(instructions)
