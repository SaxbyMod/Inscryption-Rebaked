extends Resource
class_name cardData

@export_category("Appearance")
@export var cardGfx : Texture2D
@export var cardName : String = "Card Name here"
@export_multiline var cardDesc: String = "Card description here"

@export_category("Stats")
@export_enum("Blood","Bone","Energy") var costType = 0
@export var costAmount = 0

@export var health : int = 1
@export var power : int = 0
