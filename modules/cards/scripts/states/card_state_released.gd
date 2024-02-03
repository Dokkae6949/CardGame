extends State


@export_group("State References")
@export var idle_state: State
@export var hover_state: State

var _hovered: bool


func _sm_enter() -> void:
	transition_requested.emit(hover_state if _hovered else idle_state)


func _on_card_gui_mouse_entered() -> void:
	_hovered = true

func _on_card_gui_mouse_exited() -> void:
	_hovered = false
