extends State


@export var translator: SmoothTranslatorControl
@export var card_tilt: float = 5.0
@export_group("Grab Offset")
@export var center_grab_point: bool = true
@export var grab_point_offset: Vector2
@export_group("State References")
@export var released_state: State


func _sm_enter() -> void:
	if translator: translator.target_rotation = card_tilt

func _sm_exit() -> void:
	if translator: translator.target_rotation = 0

func _sm_process(delta: float) -> void:
	if translator == null: return
	
	var offset: Vector2 = (translator.node.size * 0.5 if center_grab_point else Vector2.ZERO) + grab_point_offset
	
	translator.target_position = translator.node.get_global_mouse_position() - offset


func _on_card_gui_gui_input(event: InputEvent) -> void:
	if released_state == null: return
	
	if event.is_action_released("card_select") or event.is_action_pressed("card_cancel"):
		transition_requested.emit(released_state)
