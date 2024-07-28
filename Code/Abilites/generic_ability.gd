# This is the base for all card abilities
# If a card "ticks" this code executes depending on the turnWait
# the turnWait variable basically means how many turns it waits until it runs
# Do not add ability-specific code here, they should be added to a script inherited from this

extends Node

class_name Ability

var parent : Card

@export var turnWait = 1
@export var turnWaitOffset = 0

func _ready():
	parent = get_parent()
	parent.card_ticked.connect(tick_power)

func tick_power():
	if not parent.slotted or (CardManager.turnCounter + turnWaitOffset) % turnWait != 0:
		return true
	
	return false
