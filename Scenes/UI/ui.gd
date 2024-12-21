extends CanvasLayer
class_name UI

const SUN_SCENE = preload("res://Scenes/Effects/sun.tscn")
@export var card_list:Array[CardTemplate]
@export var ChooseCardBg:TextureRect
@onready var birth_sun_component: BirthSunComponent = $BirthSunComponent

var sun_collect_pos := Vector2(40,40)

func _ready() -> void:
	birth_sun_component.birth_sun.connect(_on_birth_sun)

func start_game():
	birth_sun_component.timer.start()
	show_card_ui()

func end_game():
	birth_sun_component.timer.stop()

func _on_birth_sun(sun_num):
	var sun_scene:Sun = SUN_SCENE.instantiate()
	sun_scene.sun_num = 25
	sun_scene.position = Vector2(randf_range(50,750),-50)
	add_child(sun_scene)
	var _tween = create_tween()
	var end_pos = Vector2(sun_scene.position.x,randf_range(150,500))
	_tween.tween_property(sun_scene,"position",end_pos,5)

func show_card_ui():
	var tween = create_tween().set_ease(Tween.EASE_OUT_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(ChooseCardBg,"position",Vector2.ZERO,1)
	await tween.finished
	enable_card()
	
func enable_card():
	for card in card_list:
		card.is_disabled = false
