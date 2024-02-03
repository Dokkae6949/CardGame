@tool

extends Node


@onready var card_1: Control = $Cards/Card1
@onready var card_2: Control = $Cards/Card2
@onready var card_3: Control = $Cards/Card3
@onready var snap_point_1: Control = $SnapPoints/HBoxContainer/SnapPoint1
@onready var snap_point_2: Control = $SnapPoints/HBoxContainer/SnapPoint2
@onready var snap_point_3: Control = $SnapPoints/HBoxContainer/SnapPoint3


func _process(delta: float) -> void:
	card_1.snap_point = card_1.get_transform().basis_xform(snap_point_1.global_position) + Vector2.UP * 200
	card_2.snap_point = card_2.get_transform().basis_xform(snap_point_2.global_position) + Vector2.UP * 200
	card_3.snap_point = card_3.get_transform().basis_xform(snap_point_3.global_position) + Vector2.UP * 200
