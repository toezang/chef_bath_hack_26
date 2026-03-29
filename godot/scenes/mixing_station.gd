extends Node

@onready var listener = $Listener
@onready var sprite = $ingredients

var tex_flour   = preload("res://images/ingredients/flour.png")
var tex_pour0   = preload("res://images/ingredients/flour_pouring.png")
var tex_pour1   = preload("res://images/ingredients/flour_pouring1.png")

var is_animating = false
var cont_pouring = false

func _ready():
	sprite.visible = false
	listener.message_received.connect(_on_message_received)

func _on_message_received(msg: String):
	if msg.contains("flour"):
		cont_pouring = true
		if not is_animating:
			_start_pour()
	else:
		cont_pouring = false

func _start_pour():
	is_animating = true
	cont_pouring = true
	sprite.texture = tex_flour
	sprite.visible = true
	await get_tree().create_timer(0.2).timeout  # short initial pause, reduced from 1.0
	while cont_pouring:
		sprite.texture = tex_pour0
		await get_tree().create_timer(0.3).timeout
		if not cont_pouring:
			break
		sprite.texture = tex_pour1
		await get_tree().create_timer(0.3).timeout
	# stopped — show static flour briefly then hide
	sprite.texture = tex_flour
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	is_animating = false
	cont_pouring = false  # always reset on exit

func _pour_loop(times: int):
	for i in range(times):
		sprite.texture = tex_pour0 if i % 2 == 0 else tex_pour1
		await get_tree().create_timer(0.3).timeout
