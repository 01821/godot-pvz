extends PlantTemplate

const SUN_SCENE = preload("res://Scenes/Effects/sun.tscn")

@onready var birth_sun_component: BirthSunComponent = $BirthSunComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var UI_Node:UI

func _finish_plant():
	birth_sun_component.birth_sun.connect(_on_birth_sun)
	UI_Node = get_tree().get_first_node_in_group("UI")
	birth_sun_component.timer.start()

func _on_birth_sun(sun_num):
	animation_player.play("birth_sun")

func _create_sun():
	var sun_scene:Sun = SUN_SCENE.instantiate()
	sun_scene.position = position
	sun_scene.sun_num = birth_sun_component.sun_num
	UI_Node.add_child(sun_scene)
	var _tween = create_tween()
	var end_pos = sun_scene.position + Vector2(randf_range(-40,40),0)
	var center_pos = end_pos + Vector2(0,randf_range(-20,0))
	_tween.tween_property(sun_scene,"position",center_pos,0.3)
	_tween.tween_property(sun_scene,"position",end_pos,0.2)
