extends AnimatedSprite2D
class_name plantTemplate

@onready var health_components: HealthComponents = $HealthComponents
@onready var collision_shap: CollisionShape2D = $Area2D/CollisionShape2D

var health:float

func _ready() -> void:
	health_components.health = health
	health_components.health_update.connect(_on_health_update)

func _on_health_update(health):
	if health == 0:
		queue_free()

func _finish_plant():
	pass
