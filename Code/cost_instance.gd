extends Node2D

class_name CostInstance

func set_display(data : String, order : int):
	var databits = data.split(" ")
	
	# Gem Handling
	var check : String = databits[0]
	if check.contains("gems"):
		var gemslist = databits[0].split(":")[1].replace("{", "").replace("}", "").split(".")
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
	$Costs.visible = true
	match databits[1]:
		"blood":
			var blood = $Costs/Blood
			var countup = 0
			var spaceincrement = 25
			var costAmount = int(databits[0])
			if costAmount >= 4:
				blood.visible = true
				position.y = order * 50
			while countup != costAmount:
				if countup == 0:
					blood.visible = true
					$Counter.visible = false
				else:
					var costInstance : TextureRect = null
					costInstance = blood.duplicate()
					costInstance.position = Vector2((spaceincrement)*(countup), 0)
					$Costs.add_child(costInstance)
					$Costs.move_child(costInstance, costInstance.visibility_layer -1)
				countup += 1
		"bone":
			var bone = $Costs/Bone
			var countup = 0
			var spaceincrement = 25
			var costAmount = int(databits[0])
			if costAmount >= 4:
				bone.visible = true
				position.y = order * 50
			while countup != costAmount:
				if countup == 0:
					bone.visible = true
					$Counter.visible = false
				else:
					var costInstance : TextureRect = null
					costInstance = bone.duplicate()
					costInstance.position = Vector2((spaceincrement)*(countup), 0)
					$Costs.add_child(costInstance)
					$Costs.move_child(costInstance, costInstance.visibility_layer -1)
				countup += 1
		"bones":
			var bone = $Costs/Bone
			var countup = 0
			var spaceincrement = 25
			var costAmount = int(databits[0])
			if costAmount >= 4:
				bone.visible = true
				position.y = order * 50
			while countup != costAmount:
				if countup == 0:
					bone.visible = true
					$Counter.visible = false
				else:
					var costInstance : TextureRect = null
					costInstance = bone.duplicate()
					costInstance.position = Vector2((spaceincrement)*(countup), 0)
					$Costs.add_child(costInstance)
					$Costs.move_child(costInstance, costInstance.visibility_layer -1)
				countup += 1
		"energy":
			var energy = $Costs/Energy
			var countup = 0
			var spaceincrement = 20
			var costAmount = int(databits[0])
			if costAmount >= 5:
				energy.visible = true
				position.y = order * 50
			while countup != costAmount:
				if countup == 0:
					energy.visible = true
					$Counter.visible = false
				else:
					var costInstance : TextureRect = null
					costInstance = energy.duplicate()
					costInstance.position = Vector2((spaceincrement)*(countup), 0)
					$Costs.add_child(costInstance)
					$Costs.move_child(costInstance, costInstance.visibility_layer -1)
				countup += 1

	# This moves the display down depending on the order it was created in
	position.y = order * 50
