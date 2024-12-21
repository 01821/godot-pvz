extends Node
class_name BirthSunComponent

@export var sun_time := 2.0
@export var sun_num := 25
@onready var timer: Timer = $Timer

signal birth_sun

func _ready() -> void:
	timer.wait_time = sun_time

func _on_timer_timeout() -> void:
	birth_sun.emit(sun_num)
