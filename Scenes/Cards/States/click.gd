extends State

@onready var card_template: CardTemplate = $"../.."

func enter():
	print("植物进入点击状态")

func update(_delta: float):
	if card_template.is_plant:
		update_state.emit("Cooling")

func physics_update(_delta: float):pass

func exit():
	card_template.is_plant = false
	
