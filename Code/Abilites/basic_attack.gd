extends Ability

func tick_power():
	if super.tick_power():
		return
	
	parent.attack()
