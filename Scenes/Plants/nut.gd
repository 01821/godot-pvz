extends PlantTemplate

var health1 := 600
var health2 := 300
var anim_name := "default"

func _on_frame_changed() -> void:
	if health < 600 and health > 300 and anim_name != "anim_name2":
		play("default2")
	elif health < 300 and anim_name != "default3":
		play("default3")
