extends State

@onready var zombie_template: ZombieTemplate = $"../.."
@onready var eat_timer: Timer = $"../../EatTimer"
var eat_time := 0.6

func enter():
	print("僵尸进入吃的状态")
	zombie_template.play("Eat")
	eat_timer.wait_time = eat_time
	eat_timer.start()
	eat_timer.timeout.connect(_on_eat_timer_out)

func update(_delta: float):
	if not zombie_template.ray_cast.get_collider():
		update_state.emit("Move")
	if zombie_template.is_dead:
		update_state.emit("Dead")
	if zombie_template.health_component.health <= 20:
		update_state.emit("NotHeadEat")
	if zombie_template.is_end:
		update_state.emit("Stop")

func physics_update(_delta: float):pass

func exit():
	eat_timer.stop()

func _on_eat_timer_out():
	if zombie_template.ray_cast.get_collider():
		var plant:PlantTemplate = zombie_template.ray_cast.get_collider().get_parent()
		plant.health_component.health -= zombie_template.zombie_res.damage
		AudioManager.play_eat()
