extends Sprite2D
class_name BulletTemplate

@export var speed := 200
@export var effect:PackedScene
@export var damage := 25
@onready var ray_cast: RayCast2D = $RayCast2D

func _process(delta: float) -> void:
	position.x += speed * delta
	if ray_cast.get_collider():
		var effect_scene = effect.instantiate()
		effect_scene.global_position = global_position
		get_parent().add_child(effect_scene)
		
		var zombie:ZombieTemplate = ray_cast.get_collider().get_parent()
		zombie.health_component.health -= damage
		
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
