extends Node

@export var camera:Camera2D
@export var begin_show_anim:AnimationPlayer
@export var fail_show_anim:AnimationPlayer
@export var UINode:UI
@export var fail_area:Area2D
@onready var zombie_manager: ZombieManager = $"../ZombieManager"

var is_fail := false

func _ready() -> void:
	prepare_game()

func prepare_game():
	zombie_manager.game_success.connect(_on_game_success)
	fail_area.area_entered.connect(_on_fail_area_entered)
	#摄像机
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(camera,"position:x",camera.position.x + 200,1)
	tween.tween_property(camera,"position:x",camera.position.x,1)
	#开始字幕出现
	await tween.finished
	begin_show_anim.play("begin_show")
	AudioManager.play_ready_plant()
	#开始游戏
	await begin_show_anim.animation_finished
	start_game()

func start_game():
	zombie_manager.start_game()
	UINode.start_game()
	AudioManager.play_bgm1()

func _on_fail_area_entered(_area:Area2D):
	if not is_fail:
		is_fail = true
		fail_game()

func fail_game():
	fail_show_anim.play("failShow")
	UINode.end_game()
	zombie_manager.end_game()
	AudioManager.play_fail_music()

func _on_game_success():
	AudioManager.play_win_music()
