extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入掉头移动状态")
	zombie_template.play("NotHeadMove")

func update(_delta: float):
	zombie_template.health_component.health -= _delta
	zombie_template.position.x -= zombie_template.zombie_res.speed * _delta
	if zombie_template.is_dead:
		update_state.emit("Dead")

func physics_update(_delta: float):pass

func exit():pass
