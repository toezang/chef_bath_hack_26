extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	go_to_mixing_station()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene(newScene: String) -> void:
	if (newScene == "mixing"):
		go_to_mixing_station()
	if (newScene == "baking"):
		go_to_baking_station()
	if (newScene == "order"):
		go_to_order_station()

func go_to_mixing_station() -> void:
	get_tree().change_scene_to_file("res://mixing_station.tscn")
	
func go_to_order_station() -> void:
	get_tree().change_scene_to_file("res://order_station.tscn")

func go_to_baking_station() -> void:
	get_tree().change_scene_to_file("res://baking_station.tscn")
