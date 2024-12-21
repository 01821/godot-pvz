extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入死亡状态")
	zombie_template.play("Dead")
	zombie_template.collision_shape.disabled = true
	await zombie_template.animation_finished
	zombie_template.dead.emit(zombie_template)
	zombie_template.queue_free()

func update(_delta: float):pass

func physics_update(_delta: float):pass

func exit():pass
