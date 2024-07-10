extends Node

var selectedCard : Node2D
var currentlyHovered : Node2D

var descriptor : Node2D

func _ready():
	descriptor = get_tree().get_nodes_in_group("descriptor")[0]

func _process(delta):
	if Input.is_action_just_pressed("leftClick"):
		if currentlyHovered != null:
			# If we click a selected card then we should unselect it
			if currentlyHovered == selectedCard:
				selectedCard = null
				return
			
			# If we hover over a card we should select it
			if currentlyHovered.is_in_group("card"):
				selectedCard = currentlyHovered
			
			# If we hover over a slot and have a selected card then we should put our card there
			if currentlyHovered.is_in_group("slot") and selectedCard != null:
				selectedCard.parentSlot = currentlyHovered
				selectedCard = null
