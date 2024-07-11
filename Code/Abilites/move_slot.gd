extends Ability

func tick_power():
	if super.tick_power():
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
