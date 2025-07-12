extends Node2D

class_name CostInstance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_display(data : String, order : int):
	print("DATA: ", data)
	var databits = data.split(" ")
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
		"gem":
			#This is also temporary [Rework later to apply gems properly]
			$Gems.visible = true
			
	# This moves the display down depending on the order it was created in
	position.y = order * 50
