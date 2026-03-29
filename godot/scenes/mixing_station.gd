extends Node

@onready var listener = $Listener
@onready var sprite = $ingredients
@onready var weight_label = $Label

var tex_flour   = preload("res://images/ingredients/flour.png")
var tex_pour0   = preload("res://images/ingredients/flour_pouring.png")
var tex_pour1   = preload("res://images/ingredients/flour_pouring1.png")

var current_grams = 0.0
var grams_per_second = 40.0
var is_animating = false
var cont_pouring = false

func _ready():
	print("ready")
	sprite.visible = false
	# Listen for RFID cards
	print("will listen")
	print("listener: ",listener)
	listener.message_received.connect(_on_message_received)

func _on_message_received(msg: String):
	print("received")
	if msg.contains("flour"):
		cont_pouring = true
		print("pouring")
		if not is_animating:
			print("not pouring")
			_start_pour()
	else:
		cont_pouring = false

func _start_pour():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_flour
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_flour
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false

# Pouring animation loop
func _pour_loop(times: int):
	for i in range(times):
		sprite.texture = tex_pour0 if i % 2 == 0 else tex_pour1
		await get_tree().create_timer(0.3).timeout
		
# Count grams being weighed
func _process(delta):
	if is_animating and cont_pouring:
		current_grams += grams_per_second * delta
		weight_label.text = str(int(current_grams)) + "g"
