extends State

@onready var card_template: CardTemplate = $"../.."

func enter():
	print("植物进入等待阳光状态")
	card_template.card_dark.visible = true

func update(_delta: float):
	if card_template.is_sun_enough:
		update_state.emit("Ready")

func physics_update(_delta: float):pass

func exit():pass
