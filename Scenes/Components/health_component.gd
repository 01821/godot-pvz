extends Node
class_name HealthComponent

signal health_update(health:float)

var health:float:
	set(v):
		health = v
		if health <= 0:
			health = 0
		health_update.emit(health)
		print(health)
