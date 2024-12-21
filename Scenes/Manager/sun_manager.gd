class_name SunManager
extends Node

@export var start_sun := 10
@export var sun_label:Label

var UINode:UI
var card_list:Array[CardTemplate]

var sun:
	set(value):
		sun = value
		sun_label.text = str(value)
		for card in card_list:
			card._is_sun_enough(value)

func _ready() -> void:
	UINode = get_tree().get_first_node_in_group("UI")
	card_list = UINode.card_list
	for card in card_list:
		card.card_plant.connect(_on_card_plant)
	sun = start_sun

func _on_card_plant(sun_num):
	sun -= sun_num
