extends Ability

func tick_power():
	if super.tick_power():
		return
	
	parent.playAttackAnimation()
	
	CardManager.damage_slot(parent.parentSlot.place + (4 * parent.direction), parent.power, parent)
