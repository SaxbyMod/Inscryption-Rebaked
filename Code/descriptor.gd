extends Node2D

var timer : float = 0.0
var typeDict = {0 : "Blood", 1 : "Bone", 2 : "Energy"}

func _process(delta):
	if Player.currentlyHovered != null:
		if Player.currentlyHovered.is_in_group("card"):
			var costString = str(Player.currentlyHovered.costAmount) + " " + str(typeDict[Player.currentlyHovered.costType])
			if Player.currentlyHovered.costAmount == 0:
				costString = "Nothing"
			
			$Control/Name.text = Player.currentlyHovered.cardName
			$Control/Desc.text = Player.currentlyHovered.cardDesc + "\n\nCost: " + costString
			timer = 0.1
	else:
		if timer > 0:
			timer -= delta
		else:
			$Control/Name.text = " FPS: " + str(round(1/delta)) # This is just a debug thing
			$Control/Desc.text = "Debug information (temporary)"
