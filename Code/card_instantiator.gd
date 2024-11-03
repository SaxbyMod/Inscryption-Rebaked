extends Node

@export var cardObject : PackedScene
@export var availableCards : Array[cardData] = []
@onready var cardParent : Node2D

# A card is 254 units wide, so that's good to keep in mind
var horizontalOffset = 260

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
		
		summon.position = Vector2(horizontalOffset * n, 0)


func _process(delta):
	pass
