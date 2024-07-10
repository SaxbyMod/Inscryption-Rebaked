extends Node2D

@export var cardGfx : Texture2D
@export var cardName : String = "Card"
@export var cardDesc: String = "A Dummy Card with no real use"

var mouseHover = false

var originalSpritePosition : Vector2

var parentSlot : Node2D
var prevParentSlot : Node2D

func _ready():
	$CardGfx.texture = cardGfx
	originalSpritePosition = $CardGfx.position


func _process(delta):
	# If the card changes slots then it sets its previous slot to be unoccupied
	if parentSlot != prevParentSlot and prevParentSlot != null:
		prevParentSlot.occupied = false
	
	# Graphics code (scary-looking)
	if mouseHover:
		$CardGfx.scale.x = lerp($CardGfx.scale.x, 1.1, 0.1)
		$CardGfx.scale.y = lerp($CardGfx.scale.y, 1.1, 0.1)
	else:
		$CardGfx.scale.x = lerp($CardGfx.scale.x, 1.0, 0.1)
		$CardGfx.scale.y = lerp($CardGfx.scale.y, 1.0, 0.1)
	
	if Player.selectedCard == self:
		$CardGfx.position.y = lerp($CardGfx.position.y, originalSpritePosition.y - 10, 0.1)
	else:
		$CardGfx.position.y = lerp($CardGfx.position.y, originalSpritePosition.y, 0.1)
	
	# If the card has no slot then it goes to it, also happens when its slot changes
	if parentSlot != null:
		parentSlot.occupied = true
		position.x = lerp(position.x, parentSlot.position.x, 0.1)
		position.y = lerp(position.y, parentSlot.position.y, 0.1)
	
	prevParentSlot = parentSlot


# Tells the player they are hovering over this object
func _on_area_2d_mouse_entered():
	mouseHover = true
	Player.currentlyHovered = self

func _on_area_2d_mouse_exited():
	mouseHover = false
	if Player.currentlyHovered == self:
		Player.currentlyHovered = null
