extends Node2D

var timer : float = 0.0

func _process(delta):
	if Player.currentlyHovered != null:
		if Player.currentlyHovered.is_in_group("card"):
			$Control/Name.text = Player.currentlyHovered.cardName
			$Control/Desc.text = Player.currentlyHovered.cardDesc
			timer = 0.1
	else:
		if timer > 0:
			timer -= delta
		else:
			$Control/Name.text = " FPS: " + str(round(1/delta)) # This is just a debug thing
			$Control/Desc.text = "Debug information (temporary)"
