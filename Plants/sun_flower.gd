extends plantTemplate

const SUN_SCENE = preload("res://Scenes/Effects/sun.tscn")

@onready var birth_sun_components: BirthSunComponents = $BirthSunComponents
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var UI_Node:UI
#func _ready() -> void:
	#UI_Node = get_tree().get_first_node_in_group("UI")
	#birth_sun_components.birth_sun.connect(_on_birth_sun)
	
func _on_birth_sun(sun_num):
	animation_player.play("Attack")
	_create_sun(sun_num)

func _finish_plant():
	UI_Node = get_tree().get_first_node_in_group("UI")
	birth_sun_components.birth_sun.connect(_on_birth_sun)
	birth_sun_components.timer.start()

func _create_sun(sun_num):
	var sun_scene:Sun = SUN_SCENE.instantiate()
	sun_scene.position = position
	sun_scene.sun_num = sun_num
	UI_Node.add_child(sun_scene)
	var _tween = create_tween()
	var end_pos = sun_scene.position + Vector2(randf_range(-40,40),0)
	var center_pos = end_pos + Vector2(0,randf_range(-20,0))
	_tween.tween_property(sun_scene,"position",center_pos,0.3)
	_tween.tween_property(sun_scene,"position",end_pos,0.2)
