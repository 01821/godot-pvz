extends Control
class_name Cell

@onready var texture_rect: TextureRect = $TextureRect

signal click_cell
signal mouse_enter
signal mouse_exit
var has_plant := false

func _on_button_pressed() -> void:
	if not has_plant:
		click_cell.emit(self)

func _on_mouse_entered() -> void:
	if not has_plant:
		mouse_enter.emit(self)

func _on_mouse_exited() -> void:
	if not has_plant:
		mouse_exit.emit(self)
