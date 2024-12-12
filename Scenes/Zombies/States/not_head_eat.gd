extends State

@onready var zombie_template: ZombieTemplate = $"../.."

func enter():
	print("僵尸进入丢头吃的状态")
	zombie_template.play("NotHeadEat")


func update(_delta: float):pass

func physics_update(_delta: float):pass

func exit():pass
