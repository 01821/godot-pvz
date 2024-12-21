extends State

@onready var card_template: CardTemplate = $"../.."

func enter():
	print("植物进入禁止状态")

func update(_delta: float):
	if not card_template.is_disabled:
		update_state.emit("Cooling")

func physics_update(_delta: float):pass

func exit():pass
