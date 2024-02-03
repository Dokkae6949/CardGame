@icon("res://modules/shared/state_machine/assets/icons/state_machine_icon.png")

class_name StateMachine
extends Node


signal state_changed(old_state: State, new_state: State)

@export var initial_state: State
@export_group("Behavior")
## Whether or not a transition to another state can happen.
@export var can_transition: bool = true

var _active_state: State = null


func _ready() -> void:
	_transition(initial_state)

func _process(delta: float) -> void:
	if _active_state:
		_active_state._sm_process(delta)

func _physics_process(delta: float) -> void:
	if _active_state:
		_active_state._sm_physics_process(delta)

func _input(event: InputEvent) -> void:
	if _active_state:
		_active_state._sm_input(event)


func _transition(new_state: State) -> void:
	if !can_transition or new_state == null: return
	
	if _active_state:
		_active_state.transition_requested.disconnect(_transition)
		_active_state._sm_exit()
	
	var old_state := _active_state
	_active_state = new_state
	
	_active_state.transition_requested.connect(_transition)
	_active_state._sm_enter()
	
	state_changed.emit(old_state, _active_state)
