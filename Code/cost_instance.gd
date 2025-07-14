extends Node2D

class_name CostInstance

func set_display(data : String, order : int):
	print("DATA: ", data)
	var databits = data.split(" ")
	
	# Gem Handling
	var check : String = databits[0]
	if check.contains("gems"):
		var gemslist = databits[0].split(":")[1].replace("{", "").replace("}", "").split(".")
		print(gemslist)
		$Gems.visible = true
		for gem in gemslist:
			if gem == "sapphire":
				$Gems/Sapphire.visible = true
			if gem == "ruby":
				$Gems/Ruby.visible = true
			if gem == "onyx":
				$Gems/Onyx.visible = true
			if gem == "emerald":
				$Gems/Emerald.visible = true
		position.y = order * 50
		$Counter.visible = false
		return
		
	# Cost Handling
	$Counter.text = "x" + databits[0]
	match databits[1]:
		"blood":
			$Blood.visible = true
		"bone":
			$Bone.visible = true
		"bones":
			$Bone.visible = true
		"energy":
			$Energy.visible = true

	# This moves the display down depending on the order it was created in
	position.y = order * 50
