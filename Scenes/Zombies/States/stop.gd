extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入停止状态")
	zombie_template.play("Stop")

func update(_delta: float):pass

func physics_update(_delta: float):pass

func exit():pass
