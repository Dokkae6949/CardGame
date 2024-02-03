@icon("res://modules/shared/state_machine/assets/icons/state-icon.svg")

class_name State
extends Node


signal transition_requested(next_state: State)


func _sm_enter() -> void:
	pass

func _sm_exit() -> void:
	pass

func _sm_process(delta: float) -> void:
	pass

func _sm_physics_process(delta: float) -> void:
	pass

func _sm_input(event: InputEvent) -> void:
	pass
