extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入移动状态")
	zombie_template.play("Move")

func update(_delta: float):
	if zombie_template.frame >= 6  and  zombie_template.frame <= 11:
		zombie_template.position.x -= zombie_template.zombie_res.speed * _delta
	if zombie_template.frame <= 23 and zombie_template.frame >= 16:
		zombie_template.position.x -= zombie_template.zombie_res.speed * _delta
	if zombie_template.is_dead:
		update_state.emit("Dead")
		return
	if zombie_template.ray_cast.get_collider():
		update_state.emit("Eat")

func physics_update(_delta: float):pass

func exit():pass
