extends Area2D

@onready var mixingBowl = $"../../mixing_station/mixingBowl"

@onready var orderTicket = $"../ticketArea"

@onready var parentScript = $"../.."

var state = "ordering";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Scene loaded:", "ordering")
	state = "ordering"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	print("i have been clicked")
	if state == "ordering":
		state = "waiting"
		Game.currentRecipe = Game.helloWorldSouffle
		print("creating an order")
		print('hello world souffle 0:', Game.helloWorldSouffle[0])
		orderTicket._changeText(
			Game.helloWorldSouffle[0],
			Game.helloWorldSouffle[1],
			Game.helloWorldSouffle[2],
		)

	
		
