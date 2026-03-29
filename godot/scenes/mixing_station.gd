extends Node

@onready var listener = $Listener
@onready var sprite = $ingredients
@onready var weight_label = $Label

var tex_flour   = preload("res://images/ingredients/flour.png")
var tex_pour0_flour   = preload("res://images/ingredients/flour_pouring.png")
var tex_pour1_flour   = preload("res://images/ingredients/flour_pouring1.png")
var tex_oats   = preload("res://images/ingredients/oats.png")
var tex_pour0_oats   = preload("res://images/ingredients/oats_pouring.png")
var tex_pour1_oats   = preload("res://images/ingredients/oats_pouring1.png")
var tex_toffee   = preload("res://images/ingredients/toffee.png")
var tex_pour0_toffee   = preload("res://images/ingredients/toffee_pouring.png")
var tex_pour1_toffee   = preload("res://images/ingredients/toffee_pouring1.png")
var tex_lemon   = preload("res://images/ingredients/lemon.png")
var tex_pour0_lemon   = preload("res://images/ingredients/lemon_pouring.png")
var tex_pour1_lemon   = preload("res://images/ingredients/lemon_pouring1.png")
var tex_sugar   = preload("res://images/ingredients/sugar.png")
var tex_pour0_sugar   = preload("res://images/ingredients/sugar_pouring.png")
var tex_pour1_sugar   = preload("res://images/ingredients/sugar_pouring1.png")
var tex_egg   = preload("res://images/ingredients/egg.PNG")
var tex_pour0_egg   = preload("res://images/ingredients/egg_pouring.png")
var tex_pour1_egg   = preload("res://images/ingredients/egg_pouring1.png")
var tex_butter   = preload("res://images/ingredients/butter.PNG")
var tex_pour0_butter   = preload("res://images/ingredients/butter_pouring.png")
var tex_pour1_butter   = preload("res://images/ingredients/butter_pouring1.png")
var tex_cinnamon   = preload("res://images/ingredients/cinnamon.PNG")
var tex_pour0_cinnamon   = preload("res://images/ingredients/cinnamon_pouring.png")
var tex_pour1_cinnamon   = preload("res://images/ingredients/cinnamon_pouring1.png")



var current_grams = 0.0
var grams_per_second = 40.0
var is_animating = false
var cont_pouring = false

func _ready():
	weight_label.text = "0g"
	print("ready")
	sprite.visible = false
	# Listen for RFID cards
	print("will listen")
	print("listener: ",listener)
	listener.message_received.connect(_on_message_received)

func _on_message_received(msg: String):
	if msg.contains("flour"):
		cont_pouring = true
		if not is_animating:
			_start_pour_flour()
	elif msg.contains("toffee"):
		cont_pouring = true
		if not is_animating:
			_start_pour_toffee()
	elif msg.contains("oats"):
		cont_pouring = true
		if not is_animating:
			_start_pour_oats()
	elif msg.contains("sugar"):
		cont_pouring = true
		if not is_animating:
			_start_pour_sugar()
	elif msg.contains("egg"):
		cont_pouring = true
		if not is_animating:
			_start_pour_egg()
	elif msg.contains("cinnamon"):
		cont_pouring = true
		if not is_animating:
			_start_pour_cinnamon()	

  
	elif msg.contains("butter"):
		cont_pouring = true
		if not is_animating:
			_start_pour_butter()

	elif msg.contains("lemon"):
		cont_pouring = true
		if not is_animating:
			_start_pour_lemon()
	else:
		cont_pouring = false

func _start_pour_sugar():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_sugar
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_sugar
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_sugar
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_sugar
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false


func _start_pour_butter():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_butter
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_butter
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_butter
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_butter
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false


func _start_pour_cinnamon():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_cinnamon
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_cinnamon
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_cinnamon
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_cinnamon
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false


func _start_pour_egg():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_egg
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_egg
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_egg
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_egg
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false

func _start_pour_flour():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_flour
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_flour
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_flour
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_flour
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false

func _start_pour_lemon():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_lemon
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_lemon
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_lemon
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_lemon
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false

func _start_pour_toffee():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_toffee
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_toffee
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_toffee
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_toffee
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false

func _start_pour_oats():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_oats
	sprite.visible = true
	current_grams = 0.0
	await get_tree().create_timer(0.2).timeout # Pause briefly
	while cont_pouring:
		sprite.texture = tex_pour0_oats
		await get_tree().create_timer(0.1).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1_oats
		await get_tree().create_timer(0.1).timeout
		
	# Show upright icon before putting away
	sprite.texture = tex_oats
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false

# Pouring animation loop
func _pour_loop_flour(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_flour if i % 2 == 0 else tex_pour1_flour
		await get_tree().create_timer(0.3).timeout

func _pour_loop_cinnamon(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_cinnamon if i % 2 == 0 else tex_pour1_cinnamon
		await get_tree().create_timer(0.3).timeout


func _pour_loop_butter(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_butter if i % 2 == 0 else tex_pour1_butter
		await get_tree().create_timer(0.3).timeout

func _pour_loop_egg(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_egg if i % 2 == 0 else tex_pour1_egg
		await get_tree().create_timer(0.3).timeout
	

func _pour_loop_sugar(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_sugar if i % 2 == 0 else tex_pour1_sugar
		await get_tree().create_timer(0.3).timeout

func _pour_loop_lemon(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_lemon if i % 2 == 0 else tex_pour1_lemon
		await get_tree().create_timer(0.3).timeout

func _pour_loop_toffee(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_toffee if i % 2 == 0 else tex_pour1_toffee
		await get_tree().create_timer(0.3).timeout

func _pour_loop_oats(times: int):
	for i in range(times):
		sprite.texture = tex_pour0_oats if i % 2 == 0 else tex_pour1_oats
		await get_tree().create_timer(0.3).timeout


# Count grams being weighed
func _process(delta):
	if is_animating and cont_pouring:
		current_grams += grams_per_second * delta
		weight_label.text = str(int(current_grams)) + "g"
