class_name CardGUI
extends Control


@export var card_data: Card : 
	set (value):
		card_data = value
		update_gui()
@export var image: TextureRect
@export var title: Label
@export var description: Label


func _ready() -> void:
	update_gui()


func update_gui() -> void:
	if card_data == null: return
	
	if image: image.texture = card_data.image
	if title: title.text = card_data.title
	if description: description.text = card_data.description
