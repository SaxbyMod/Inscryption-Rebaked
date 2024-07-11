extends Node

var damage = 5


func _process(delta):
	if CardManager.damage >= 10:
		print("You Win")
	elif CardManager.damage <= 0:
		print("You Lose")
	print("Scale: " + str(damage))
