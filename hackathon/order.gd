extends Area2D

var isShowingRecipe = true;

var labelBody = $orderCollisionShape/Polygon2D/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func switch_sides() -> void:
	if isShowingRecipe:
		labelBody.text = "hiii"
	else: 
