# This is the base for all card abilities
# If a card "ticks" this code executes and depending on the turnwait

extends Node

var parent : Card

@export var turnWait = 1
@export var turnWaitOffset = 0

func _ready():
	parent = get_parent()
	print(parent.get_class())
	parent.card_ticked.connect(tick_power)

func tick_power():
	if not parent.slotted or (Player.turnCounter + turnWaitOffset) % turnWait != 0:
		return
	
	# Special function should go beyond this point
	print("I have been ticked")
