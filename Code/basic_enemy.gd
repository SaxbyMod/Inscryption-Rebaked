extends Node

class_name Enemy

@export var cardToPlay : PackedScene
@export var cardCooldown : int = 4
var nextActivation = 1

func play():
	if nextActivation <= CardManager.turnCounter:
		nextActivation = CardManager.turnCounter + cardCooldown
		var curCard : Card = cardToPlay.instantiate()
		curCard.enemyCard = true
		
		var slots = get_tree().get_nodes_in_group("slot")
		
		for n in len(slots):
			var slot : Slot = slots[n]
			if slot.enemy and !CardManager.slot_occupied(slot.place):
				curCard.parentSlot = slot
		
		add_child(curCard)
		
		curCard.position = Vector2(0, -700)
	
