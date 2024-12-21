extends AnimatedSprite2D
class_name ZombieTemplate

@export var zombie_res:ZombieRes
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D

signal dead

var is_dead := false
var is_end := false

func _ready() -> void:
	health_component.health = zombie_res.max_health
	health_component.health_update.connect(_on_health_update)
	
func _on_health_update(health):
	if health == 0:
		is_dead = true
