extends Node
'''加载场景'''
enum Scene_Type{
	Start_Scene,
	Start_Menu,
	Level1
}
@export var sceneArray:Array[PackedScene]

var current:Scene_Type = Scene_Type.Start_Scene
var old_scene:Scene_Type

func change_next_scene(next_scene:Scene_Type):
	old_scene = current
	current = next_scene
	get_tree().change_scene_to_packed(sceneArray[next_scene])

func turn_back_scene():
	var temp:Scene_Type = old_scene
	old_scene = current
	current = temp
	
	get_tree().change_scene_to_packed(sceneArray[current])
