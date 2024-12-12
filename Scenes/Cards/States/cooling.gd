extends State

@onready var card_template: CardTemplate = $"../.."

func enter():
	await get_tree().create_timer(0.0).timeout #等待1帧，初始化进度条
	print("植物进入冷却状态")
	card_template.cd_time = 0.0
	card_template.card_cool_progress.value = 100
	card_template.card_dark.visible = true

func update(_delta: float):
	card_template.cd_time += _delta
	card_template.card_cool_progress.value = (card_template.card_res.cool_time - card_template.cd_time) / card_template.card_res.cool_time * 100
	if card_template.cd_time >= card_template.card_res.cool_time:
		update_state.emit("WaitingSun")
		
func physics_update(_delta: float):pass

func exit():pass
