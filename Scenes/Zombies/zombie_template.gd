extends AnimatedSprite2D
class_name ZombieTemplate

@export var zombie_res : ZombieRes
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var attack_component: AttackComponent = $AttackComponent
@onready var health_components: HealthComponents = $HealthComponents
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D

var is_dead := false

func _ready() -> void:
	#attack_component.attack.connect(_on_attack)
	health_components.health = zombie_res.health
	health_components.health_update.connect(_on_health_update)

#func _on_attack():
	#if ray_cast.get_collider():
		#var plant:plantTemplate = ray_cast.get_collider().get_parent()
		#plant.health_components.health -= zombie_res.damager

func _on_health_update(health):
	if health == 0:
		is_dead = true
