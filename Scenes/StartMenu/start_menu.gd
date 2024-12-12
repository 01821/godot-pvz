extends Control

@export var level_1:PackedScene

func _on_button_pressed() -> void:
	SceneManager.change_next_scene(SceneManager.Scene_Type.Level1)
