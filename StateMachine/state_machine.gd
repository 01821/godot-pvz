class_name StateMachine
extends Node

@export var init_state: State

var states: Dictionary = {}
var current_state: State

func _ready() -> void:
	for state in get_children():
		if state is State:
			states[state.name.to_upper()] = state
			state.update_state.connect(_on_update_state)
	if init_state:
		init_state.enter()
		current_state = init_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _on_update_state(state_name: String):
	if current_state.name == state_name:
		return
		
	var new_state : State = states[state_name.to_upper()]
	
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
	
