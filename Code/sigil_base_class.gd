extends Node

class_name Sigil

var cardParent : Card

func _ready() -> void:
	cardParent = get_parent().get_parent().get_parent().get_parent().cardName

func test():
	print("Sigil test poke")
