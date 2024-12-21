extends AnimatedSprite2D
class_name Sun

@export var collect_speed := 600
@export var disappear_time := 25
@onready var disappear_timer: Timer = $DisappearTimer

var sun_num : int
var is_click := false
var UI_Node:UI

func _ready() -> void:
	disappear_timer.wait_time = disappear_time
	disappear_timer.start()

func _on_button_pressed() -> void:
	if not is_click:
		AudioManager.play_collect_sun()
		is_click = true
		var sun_manager:SunManager = get_tree().get_first_node_in_group("SunManager")
		UI_Node = get_parent()
		var _tween = create_tween()
		var end_pos = UI_Node.sun_collect_pos
		var dua = position.distance_to(end_pos) / collect_speed
		_tween.tween_property(self,"position",end_pos,dua)
		await _tween.finished
		sun_manager.sun += sun_num
		queue_free()

func _on_disappear_timer_timeout() -> void:
	if not is_click:
		is_click = true
		var _tween = create_tween()
		_tween.tween_property(self,"modulate",Color(1,1,1,0),1)
		await _tween.finished
		queue_free()
