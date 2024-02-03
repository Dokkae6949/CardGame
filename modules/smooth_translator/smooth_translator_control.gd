class_name SmoothTranslatorControl
extends Node


@export var node: Control
@export var lerp_speed: float = 15.0
@export_group("Targets")
@export var target_position: Vector2
@export var target_rotation: float
@export var target_size: Vector2


func _process(delta: float) -> void:
	if node == null: return
	
	node.position = node.position.lerp(target_position, delta * lerp_speed)
	node.rotation_degrees = lerpf(node.rotation_degrees, target_rotation, delta * lerp_speed)
	node.size = node.size.lerp(target_size, delta * lerp_speed)
