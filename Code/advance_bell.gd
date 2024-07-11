extends Button

var Slots = []
var Slot = 0
var Card = 0
var Cards = []
# Most braindead easy code ever
	
func _on_pressed():
	for Card in get_tree().get_nodes_in_group("card"):
		Cards.append(Card)
	for Slot in get_tree().get_nodes_in_group("slot"):
		Slots.append(Slot)
	Player.advance_turn()
	var Damage = 5
	if !Slots[0].occupied || !Slots[1].occupied || !Slots[2].occupied || !Slots[3].occupied:
		Damage += Cards[Card].power
	elif !Slots[4].occupied || !Slots[5].occupied || !Slots[6].occupied || !Slots[7].occupied:
		Damage -= Cards[Card].power
	
	if Damage == 10:
		print("You Win")
	elif Damage == 0:
		print("You Lose")
	
	print("Scale: " + str(Damage))
