extends RichTextLabel

func _process(delta):
	text = "[COST LEVELS]\nBlood: " + str(Player.levels[0]) + "\nBone: " + str(Player.levels[1]) + "\nEnergy: " + str(Player.levels[2])
