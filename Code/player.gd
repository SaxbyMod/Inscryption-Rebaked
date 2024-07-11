extends Node

var selectedCard : Card
var currentlyHovered : Node2D

var levels = [1,2,3]

var turnCounter = 0

func _process(delta):
	if get_tree().current_scene != null:
		if not get_tree().current_scene.is_in_group("cardPlayer"):
			return

	if Input.is_action_just_pressed("leftClick"):
		if currentlyHovered != null:
			# If we click a selected card then we should unselect it
			if currentlyHovered == selectedCard:
				selectedCard = null
				return
			
			# If we hover over a card we should select it
			if currentlyHovered.is_in_group("card"):
				if not currentlyHovered.slotted:
					selectedCard = currentlyHovered
			
			# If we hover over a slot and have a selected card then we should put our card there
			if currentlyHovered.is_in_group("slot") and selectedCard != null:
				if not currentlyHovered.enemy:
					play_card()
	
	if Input.is_action_just_pressed("Spacebar"):
		advance_turn()

func play_card():
	print(levels[selectedCard.costType])
	if levels[selectedCard.costType] - selectedCard.costAmount >= 0:
		levels[selectedCard.costType] -= selectedCard.costAmount
		selectedCard.parentSlot = currentlyHovered
		selectedCard = null

func advance_turn():
	turnCounter += 1
	print("Turn ", turnCounter)
	var cards = get_tree().get_nodes_in_group("card")
	
	for n in len(cards):
		var cur : Card = cards[n]
		cur.tick_turn()
