extends plantTemplate

const PEA_BULLET_SCENE = preload("res://Scenes/Bullet/pea_bullet.tscn")

@onready var attack_component: AttackComponent = $AttackComponent
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var marker: Marker2D = $Marker2D

func _finish_plant():
	ray_cast.target_position.x = 800 - position.x

func _process(delta: float) -> void:
	if ray_cast.get_collider() and not attack_component.can_attack:
		attack_component.can_attack = true
	elif not ray_cast.get_collider():
		attack_component.can_attack = false

func _on_animation_finished() -> void:
	if not attack_component.can_attack:
		play("default")
	if attack_component.can_attack:
		play("attack")

func _on_frame_changed() -> void:
	if animation == "attack" and frame == 11:
		var pea_bullet_scene:BulletTemplate = PEA_BULLET_SCENE.instantiate()
		pea_bullet_scene.global_position = marker.global_position
		get_parent().add_child(pea_bullet_scene)
