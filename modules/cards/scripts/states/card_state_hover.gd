extends State


@export_group("State References")
@export var idle_state: State
@export var drag_state: State


func _on_card_gui_mouse_exited() -> void:
	if idle_state == null: return
	
	transition_requested.emit(idle_state)

func _on_card_gui_gui_input(event: InputEvent) -> void:
	if drag_state == null: return
	
	if event.is_action_pressed("card_select"):
		transition_requested.emit(drag_state)
