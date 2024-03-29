class_name Card
extends Resource


@export var title: String
@export var image: Texture
@export_multiline var description: String

## Actions executed when the card has been played
@export var actions: Array[CardAction]
