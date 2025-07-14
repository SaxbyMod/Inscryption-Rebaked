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
		var countup = 0
		var sapphire = $Gems/Sapphire
		var emerald = $Gems/Emerald
		var ruby = $Gems/Ruby
		var onyx = $Gems/Onyx
		for gem in gemslist:
			var gemamount = len(gemslist)
			var spaceincrement = 45 - (5 * (gemamount+2))
			if gem == "sapphire":
				if countup == 0:
					sapphire.visible = true
				else:
					if sapphire.visible == true:
						var costInstance : TextureRect = null
						costInstance = sapphire.duplicate()
						costInstance.position = Vector2((spaceincrement)*countup, 0)
						$Gems.add_child(costInstance)
						$Gems.move_child(costInstance, costInstance.visibility_layer -1)
					else:
						sapphire.visible = true
						sapphire.position = Vector2((spaceincrement)*countup, 0)
						$Gems.move_child(sapphire, sapphire.visibility_layer -1)
			if gem == "ruby":
				if countup == 0:
					ruby.visible = true
				else:
					if ruby.visible == true:
						var costInstance : TextureRect = null
						costInstance = ruby.duplicate()
						costInstance.position = Vector2((spaceincrement)*countup, 0)
						$Gems.add_child(costInstance)
						$Gems.move_child(costInstance, costInstance.visibility_layer -1)
					else:
						ruby.visible = true
						ruby.position = Vector2((spaceincrement)*countup, 0)
						$Gems.move_child(ruby, ruby.visibility_layer -1)
			if gem == "onyx":
				if countup == 0:
					onyx.visible = true
				else:
					if onyx.visible == true:
						var costInstance : TextureRect = null
						costInstance = onyx.duplicate()
						costInstance.position = Vector2((spaceincrement)*countup, 0)
						$Gems.add_child(costInstance)
						$Gems.move_child(costInstance, costInstance.visibility_layer -1)
					else:
						onyx.visible = true
						onyx.position = Vector2((spaceincrement)*countup, 0)
						$Gems.move_child(onyx, onyx.visibility_layer -1)
			if gem == "emerald":
				if countup == 0:
					emerald.visible = true
				else:
					if emerald.visible == true:
						var costInstance : TextureRect = null
						costInstance = emerald.duplicate()
						costInstance.position = Vector2((spaceincrement)*countup, 0)
						$Gems.add_child(costInstance)
						$Gems.move_child(costInstance, costInstance.visibility_layer -1)
					else:
						emerald.visible = true
						emerald.position = Vector2((spaceincrement)*countup, 0)
						$Gems.move_child(emerald, emerald.visibility_layer -1)
			countup += 1
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
