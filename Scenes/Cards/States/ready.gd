extends State

@onready var card_template: CardTemplate = $"../.."

func enter():
	print("植物进入等待点击状态")
	card_template.card_dark.visible = false


func update(_delta: float):
	if not card_template.is_sun_enough:
		update_state.emit("WaitingSun")
	if card_template.is_click:
		update_state.emit("Click")

func physics_update(_delta: float):pass

func exit():pass
