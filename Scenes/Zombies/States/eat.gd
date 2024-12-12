extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入吃的状态")
	zombie_template.play("Eat")
	zombie_template.attack_component.timer.start()
	zombie_template.attack_component.can_attack = true
	zombie_template.attack_component._on_timer_timeout()

func update(_delta: float):
	if zombie_template.is_dead:
		update_state.emit("Dead")
		return
	if not zombie_template.ray_cast.get_collider():
		update_state.emit("Move")

func physics_update(_delta: float):pass

func exit():
	zombie_template.attack_component.timer.stop()
	zombie_template.attack_component.can_attack = false
