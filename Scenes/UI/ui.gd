extends CanvasLayer
class_name UI

const SUN_SCENE = preload("res://Scenes/Effects/sun.tscn")

@export var card_list:Array[CardTemplate]
@onready var birth_sun_components: BirthSunComponents = $BirthSunComponents

var sun_collect_pos := Vector2(40,40)

func _ready() -> void:
	birth_sun_components.birth_sun.connect(_on_birth_sun)
	start_game()

func start_game():
	birth_sun_components.timer.start()

func _on_birth_sun(sun_num):
	var sun_scene:Sun = SUN_SCENE.instantiate()
	sun_scene.sun_num = 25
	sun_scene.position = Vector2(randf_range(50,750),-50)
	add_child(sun_scene)
	var _tween = create_tween()
	var end_pos = Vector2(sun_scene.position.x,randf_range(150,500))
	_tween.tween_property(sun_scene,"position",end_pos,5)
