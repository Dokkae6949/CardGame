extends Control


signal drag_started
signal drag_ended


@export var card_data: Card
@export var lerp_speed: float = 15.0

@export_group("Snap")
@export var enable_snap: bool = false
@export var snap_point: Vector2

var _target: Vector2


func _ready() -> void:
	#mouse_entered.connect(_on_mouse_entered)
	#mouse_exited.connect(_on_mouse_exited)
	#gui_input.connect(_on_gui_input)
	
	call_deferred("_post_ready")

func _post_ready() -> void:
	_target = position

func _process(delta: float) -> void:
	var offset: Vector2 = custom_minimum_size * 0.5 + grab_point_offset if center_grab_point else grab_point_offset
	
	if _dragged:
		rotation_degrees = lerpf(rotation_degrees, 5.0, delta * lerp_speed)
		_target = get_global_mouse_position() - offset
	elif enable_snap:
		rotation_degrees = lerpf(rotation_degrees, 0.0, delta * lerp_speed)
		_target = snap_point
	else:
		rotation_degrees = lerpf(rotation_degrees, 0.0, delta * lerp_speed)
	
	position = position.lerp(_target, delta * lerp_speed)


func _on_mouse_entered() -> void:
	_focused = true

func _on_mouse_exited() -> void:
	_focused = false

func _on_gui_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton: return
	if event.button_index != MOUSE_BUTTON_LEFT: return
	
	_dragged = _focused and event.pressed
	
	if _dragged: drag_started.emit()
	else: drag_ended.emit()
