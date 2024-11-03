extends Node

@export var cardObject : PackedScene
@export var availableCards : Array[cardData] = []
@onready var cardParent : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	cardParent = $Cards
	
	for n in len(availableCards):
		var summon : Card = cardObject.instantiate()
		
		summon.cardGfx = availableCards[n].cardGfx
		summon.cardName = availableCards[n].cardName
		summon.cardDesc = availableCards[n].cardDesc
		
		summon.costType = availableCards[n].costType
		summon.costAmount = availableCards[n].costAmount
		
		summon.health = availableCards[n].health
		summon.power = availableCards[n].power
		
		cardParent.add_child(summon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
