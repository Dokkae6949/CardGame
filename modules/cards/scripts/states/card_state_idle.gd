extends State


@export_group("State References")
@export var hover_state: State

var _focused: bool


func _on_card_gui_mouse_entered() -> void:
	if hover_state == null: return
	
	transition_requested.emit(hover_state)
