extends Control
class_name Cell

@onready var card_shadow: TextureRect = $CardShadow

signal click_cell
signal cell_mouse_enter
signal cell_mouse_exit

var is_plant := false

func _on_button_pressed() -> void:
	if not is_plant:
		click_cell.emit(self)

func _on_mouse_entered() -> void:
	if not is_plant:
		cell_mouse_enter.emit(self)

func _on_mouse_exited() -> void:
	if not is_plant:
		cell_mouse_exit.emit(self)
