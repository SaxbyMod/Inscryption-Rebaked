extends Node2D

class_name CostInstance

func set_display(data : String, order : int):
	print("DATA: ", data)
	var databits = data.split(" ")
	$Counter.text = "x" + databits[0]
	var gemcost : Array = []
	match databits[1]:
		"blood":
			$Blood.visible = true
		"bone":
			$Bone.visible = true
		"bones":
			$Bone.visible = true
		"energy":
			$Energy.visible = true
		"emerald":
			print("I AM DONE LATER")
		"sapphire":
			print("I AM DONE LATER")
		"ruby":
			print("I AM DONE LATER")
		"onyx":
			print("I AM DONE LATER")
	if len(databits) == 3:	
		if databits[2] == "gem" || databits[2] == "gems":
			$Gems.visible
			gemcost.append(databits[1])
	for gem in gemcost:
		if gem == "sapphire":
			$Gems/Sapphire.visible = true
		if gem == "ruby":
			$Gems/Ruby.visible = true
		if gem == "emerald":
			$Gems/Emerald.visible = true
		if gem == "onyx":
			$Gems/Onyx.visible = true
	# This moves the display down depending on the order it was created in
	position.y = order * 50
