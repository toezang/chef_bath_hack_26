extends Node2D

var mixing_station = preload("res://scenes/mixing_station.tscn")
var baking_station = preload("res://scenes/baking_station.tscn")
var serving_station = preload("res://scenes/order_station.tscn")





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	go_to_order_station()
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
	get_tree().change_scene_to_file("res://scenes/mixing_station.tscn")

func go_to_order_station() -> void:
	get_tree().change_scene_to_file("res://scenes/order_station.tscn")

func go_to_baking_station() -> void:
	get_tree().change_scene_to_file("res://scenes/baking_station.tscn")



var currentRecipe = [];


var helloWorldSouffle = [
	"Outputs Hello World",
	"72 g Honey
	101 g Egg
108 g Lemon
111 g Oat
32 g Water
87 g Walnut
114 g Raspberry
100 g Date
33 g Yam",
"Put Yam into mixing bowl.
Put Date into mixing bowl.
Put Lemon into mixing bowl.
Put Raspberry into mixing bowl.
Put Oat into mixing bowl.
Put Walnut into mixing bowl.
Put Water into mixing bowl.
Put Oat into mixing bowl.
Put Lemon into mixing bowl.
Put Lemon into mixing bowl.
Put Egg into mixing bowl.
Put Honey into mixing bowl.
Liquefy contents of the mixing bowl.
Pour contents of the mixing bowl into the baking dish."
]
