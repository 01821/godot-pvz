extends Node2D

@export var Plants:Node2D
@export var cells:GridContainer

var UINode:UI
var card_list:Array[CardTemplate]
var hand_scene:plantTemplate
var card_res:cardRes

func _ready() -> void:
	UINode = get_tree().get_first_node_in_group("UI")
	card_list = UINode.card_list
	for card in card_list:
		card.card_click.connect(_on_card_click)
		
	for cell in cells.get_children():
		cell.click_cell.connect(_on_click_cell)
		cell.mouse_enter.connect(_on_cell_mouse_enter)
		cell.mouse_exit.connect(_on_cell_mouse_exit)

func _on_card_click(card_res:cardRes):
	if not hand_scene:
		self.card_res = card_res
		hand_scene = card_res.plant_scene.instantiate()
		hand_scene.health = card_res.max_health
		UINode.add_child(hand_scene)

func _on_click_cell(cell:Cell):
	if hand_scene:
		cell.has_plant = true
		hand_scene.global_position = cell.global_position + cell.texture_rect.size/2
		hand_scene.reparent(Plants)
		hand_scene.play("default")

		for card in card_list:
			if card_res.card_type == card.card_res.card_type:
				card.is_plant = true
				card.card_plant.emit(card.card_res.sun_num)
				break
		hand_scene.collision_shap.disabled = false
		hand_scene._finish_plant()
		
		cell.texture_rect.texture = null
		hand_scene = null
		self.card_res = null

func _on_cell_mouse_enter(cell:Cell):
	if hand_scene:
		cell.texture_rect.texture = card_res.card_shadow

func _on_cell_mouse_exit(cell:Cell):
	if hand_scene:
		cell.texture_rect.texture = null
		
func _process(_delta: float) -> void:
	if hand_scene:
		hand_scene.position = get_global_mouse_position()
