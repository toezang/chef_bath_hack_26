extends Node

@onready var listener = $Listener        # add a Node child named Listener with listener.gd
@onready var sprite = $ingredients       # or whichever node should show the flour

var tex_flour   = preload("res://images/ingredients/flour.png")
var tex_pour0   = preload("res://images/ingredients/flour_pouring.png")
var tex_pour1   = preload("res://images/ingredients/flour_pouring1.png")

var is_animating = false

func _ready():
	sprite.visible = false
	listener.message_received.connect(_on_message_received)

func _on_message_received(msg: String):
	var clean = msg.replace(char(0), "").strip_edges()
	print("clean: [", clean, "]")
	if clean == "flour" and not is_animating:
		_start_pour()

func _start_pour():
	is_animating = true
	sprite.texture = tex_flour
	sprite.visible = true
	await get_tree().create_timer(1.0).timeout
	await _pour_loop(6)
	sprite.visible = false
	is_animating = false

func _pour_loop(times: int):
	for i in range(times):
		sprite.texture = tex_pour0 if i % 2 == 0 else tex_pour1
		await get_tree().create_timer(0.3).timeout
