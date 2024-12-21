extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入行走状态")
	zombie_template.play("Move")

func update(_delta: float):
	if zombie_template.frame >= 6 and zombie_template.frame <= 11:
		zombie_template.position.x -= zombie_template.zombie_res.speed * _delta
	elif zombie_template.frame <= 23 and zombie_template.frame >= 16:
		zombie_template.position.x -= zombie_template.zombie_res.speed/2 * _delta
	if zombie_template.ray_cast.get_collider():
		update_state.emit("Eat")
	if zombie_template.health_component.health <= 20:
		update_state.emit("NotHeadMove")
	if zombie_template.is_end:
		update_state.emit("Stop")
		

func physics_update(_delta: float):pass

func exit():pass
