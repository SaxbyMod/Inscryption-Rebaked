extends Node

var parent : Card

@export var turnWait = 1
@export var turnWaitOffset = 0

func _ready():
	parent = get_parent()
	parent.card_ticked.connect(tick_power)

func tick_power():
	if not parent.slotted or (Player.turnCounter + turnWaitOffset) % turnWait != 0:
		return
	
	var currentSlot = parent.parentSlot.place
	var slots = get_tree().get_nodes_in_group("slot")
	
	for n in len(slots):
		var l : Slot = slots[n]
		if l.place == (currentSlot + 1) % 4 and not l.occupied:
			parent.parentSlot = l
			break
		elif l.place == (currentSlot + 2) % 4 and not l.occupied:
			parent.parentSlot = l
