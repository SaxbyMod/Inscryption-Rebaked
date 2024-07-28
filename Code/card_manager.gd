extends Node

# 0 is player, 10 is enemy
var damage = 5

var turnCounter = 0

func _process(delta):
	if CardManager.damage >= 10:
		print("You Win")
	elif CardManager.damage <= 0:
		print("You Lose")

func advance_turn():
	# Your turn
	if Player.levels[2] < 6:
		Player.levels[2] += 1
	
	turnCounter += 1
	print("Turn ", turnCounter)
	var cards = get_tree().get_nodes_in_group("card")
	
	for n in len(cards):
		var cur : Card = cards[n]
		cur.tick_turn()
	
	#Enemy's turn
	var enemy : Enemy = get_tree().get_first_node_in_group("enemy")
	enemy.play()

func slot_occupied(place : int):
	var cards = get_tree().get_nodes_in_group("card")
	
	if len(cards) == 0:
		return false
	
	for n in len(cards):
		var cur : Card = cards[n]
		if cur.parentSlot != null:
			if cur.parentSlot.place == place:
				return true

func damage_slot(place : int, amount : int, issuer : Card):
	if slot_occupied(place):
		var cards = get_tree().get_nodes_in_group("card")
	
		if len(cards) == 0:
			return
	
		for n in len(cards):
			var cur : Card = cards[n]
			if cur.parentSlot != null:
				if cur.parentSlot.place == place:
					cur.takeDamage(amount)
	else:
		damage += amount * issuer.direction
