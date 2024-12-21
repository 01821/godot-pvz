extends Node

@onready var bgm_1: AudioStreamPlayer = $Bgm1
@onready var start_menu: AudioStreamPlayer = $StartMenu
@onready var button_click: AudioStreamPlayer = $ButtonClick
@onready var eat: AudioStreamPlayer = $Eat
@onready var last_wave: AudioStreamPlayer = $LastWave
@onready var fail_music: AudioStreamPlayer = $FailMusic
@onready var win_music: AudioStreamPlayer = $WinMusic
@onready var plant: AudioStreamPlayer = $Plant
@onready var shoot: AudioStreamPlayer = $Shoot
@onready var ready_plant: AudioStreamPlayer = $ReadyPlant
@onready var zombie_first_coming: AudioStreamPlayer = $ZombieFirstComing
@onready var collect_sun: AudioStreamPlayer = $CollectSun

func play_bgm1():
	bgm_1.play()

func play_button_click():
	button_click.play()

func play_start_menu():
	start_menu.play()

func play_eat():
	eat.play()

func play_last_wave():
	last_wave.play()

func play_fail_music():
	fail_music.play()

func play_win_music():
	win_music.play()

func play_plant():
	plant.play()

func play_shoot():
	shoot.play()

func play_ready_plant():
	ready_plant.play()

func play_zombie_first_coming():
	zombie_first_coming.play()

func play_collect_sun():
	collect_sun.play()
