extends Control

@export var start_menu:PackedScene

func _on_start_label_pressed() -> void:
	SceneManager.change_next_scene(SceneManager.Scene_Type.Start_Menu)
