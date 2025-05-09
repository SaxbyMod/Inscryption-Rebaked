extends Resource
class_name cardData

@export_category("Appearance")
@export var cardGfx : Texture2D
@export var cardName : String = "Card Name here"
@export var temple : String = ""
@export var rarity : String = "common"
@export_multiline var cardDesc: String = "Card description here"
@export_multiline var cardLore: String = "lore here"

@export_category("Cost")
@export var costs = {"Bone":0, "Blood":0, "Energy":0}

@export_category("Abilities")
@export var health : int = 1
@export var power : int = 0
@export var sigils = [""]
@export var tribes = [""]
