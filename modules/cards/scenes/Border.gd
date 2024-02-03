extends CanvasItem


@export var speed := 0.1


func _process(delta: float) -> void:
	modulate.h = wrapf(modulate.h + delta * speed, 0, 359.0)
