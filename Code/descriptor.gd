extends Node2D

func _process(delta):
	if Player.currentlyHovered != null:
		if Player.currentlyHovered.is_in_group("card"):
			$Control/Name.text = Player.currentlyHovered.cardName
			$Control/Desc.text = Player.currentlyHovered.cardDesc
	else:
		$Control/Name.text = " FPS: " + str(round(1/delta)) # This is just a debug thing
		$Control/Desc.text = "Debug information (temporary)"
