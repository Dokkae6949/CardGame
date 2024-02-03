extends Control


@export var card_scene: PackedScene
@export var cards: Array[Card] = []

var _cards: Array[Control] = []


func _ready() -> void:
	for child in get_children():
		child.queue_free()
	
	for card_data in cards:
		_add_card(card_data)


func _add_card(card: Card) -> void:
	var card_node: Control = card_scene.instantiate() as Control
	add_child(card_node)
	_cards.push_back(card_node)
	card_node.set_anchors_preset(Control.PRESET_CENTER)
	card_node.enable_snap = false
	card_node.card_data = card
	
	var i = 0
	for c in _cards:
		#c.position.x += (i - floor(cards.size() / 2.0)) * 100
		i += 1
