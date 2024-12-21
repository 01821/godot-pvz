extends Node
class_name ZombieManager

@onready var NORMAL_ZOMBIE = load("res://Scenes/Zombies/normal_zombie.tscn")
@export var Zombies:Node2D

signal game_success

var zombie_spawn_list:Array[Node2D]
var zombie_list:Array[ZombieTemplate]
var is_end := false
var spawn_over := false

func _ready() -> void:
	for zombieSpawn in Zombies.get_children():
		zombie_spawn_list.push_back(zombieSpawn)

#在之后游戏控制管理器进行调用
func start_game():
	spawn_zombie()

func end_game():
	is_end = true
	for zombie in zombie_list:
		zombie.is_end = true

#创建僵尸
func spawn_zombie():
	AudioManager.play_zombie_first_coming()
	for i in range(2):
		SpawnARandomZombie()
		await get_tree().create_timer(1).timeout
		
	await get_tree().create_timer(5).timeout

	for i in range(3):
		SpawnARandomZombie()
		await get_tree().create_timer(1).timeout
		
	await get_tree().create_timer(5).timeout
	
	#最后一波
	AudioManager.play_last_wave()
	for i in range(5):
		SpawnARandomZombie()
		await get_tree().create_timer(1).timeout
		
	spawn_over = true

#创建单个僵尸
func SpawnARandomZombie():
	if not is_end:
		var normal_zombie_scene:ZombieTemplate = NORMAL_ZOMBIE.instantiate()
		var random_index = randi_range(0,4)
		zombie_spawn_list[random_index].add_child(normal_zombie_scene)
		normal_zombie_scene.dead.connect(_on_zombie_dead)
		zombie_list.push_back(normal_zombie_scene)

func _on_zombie_dead(zombie):
	zombie_list.erase(zombie)
	if len(zombie_list) == 0 and spawn_over:
		game_success.emit()
