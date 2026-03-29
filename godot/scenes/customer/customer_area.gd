extends Area2D

@onready var mixingBowl = $"../../mixing_station/mixingBowl"

@onready var orderTicket = $"../../orderArea"

@onready var parentScript = $"../.."

var state = "";

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
	if state == "ordering":
		print("i am ordering!")
		state = "waiting"
		print(parentScript.helloWorldSoufle[0])
		print(parentScript.helloWorldSoufle[1])
		print(parentScript.helloWorldSoufle[2])
		orderTicket.create_order(
			parentScript.helloWorldSoufle[0],
			parentScript.helloWorldSoufle[1],
			parentScript.helloWorldSoufle[2],
		)
	elif state == "waiting":
		print("i would like to recieve my meal!")
	
		if mixingBowl.ingredients == [] and mixingBowl.instructions == []:
			print("no meal available!")
		else:
			print("there is a meal yay!")
	
		
