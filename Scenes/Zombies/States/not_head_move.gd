extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入掉头移动状态")
	zombie_template.play("NotHeadMove")


func update(_delta: float):pass

func physics_update(_delta: float):pass

func exit():pass
