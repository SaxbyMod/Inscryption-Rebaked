extends Node2D

class_name Card

signal card_ticked

@export_category("Appearance")
@export var cardGfx : Texture2D
@export var cardName : String = "Card"
@export_multiline var cardDesc: String = "A Dummy Card with no real use"

@export_category("Health & Power")
@export var health : int = 1
@export var power : int = 0

@export_category("Cost")
@export_enum("Blood","Bone","Energy") var costType = 0
@export var costAmount = 0

@export_group("Cost Sprites")
@export var blood : AtlasTexture
@export var bone : AtlasTexture
@export var energy : AtlasTexture

var thisCard : AtlasTexture

var mouseHover = false

var originalSpritePosition : Vector2

var parentSlot : Slot
var prevParentSlot : Slot
var slotted : bool = false

var pickupAnim = 0
# This is a very shitty solution and should be redone with proper animations
var attackAnim = 0
var attackTimer : float = 0

func _ready():
	$CardGfx.texture = cardGfx
	originalSpritePosition = $CardGfx.position
	$CardGfx/Healthbar.text = "[right]" + str(health)
	$CardGfx/Powerbar.text = str(power)
	
	match costType:
		0:
			thisCard = blood
		1:
			thisCard = bone
		2:
			thisCard = energy
	
	$CardGfx/CostDisplay/Cost.texture = thisCard
	
	if costAmount == 0:
		$CardGfx/CostDisplay.queue_free()


func _process(delta):
	# If the card changes slots then it sets its previous slot to be unoccupied
	if parentSlot != prevParentSlot and prevParentSlot != null:
		prevParentSlot.occupied = false
	
	# Graphics code (scary-looking)
	if mouseHover:
		$CardGfx.scale.x = lerp($CardGfx.scale.x, 1.1, delta * 16)
		$CardGfx.scale.y = lerp($CardGfx.scale.y, 1.1, delta * 16)
	else:
		$CardGfx.scale.x = lerp($CardGfx.scale.x, 1.0, delta * 16)
		$CardGfx.scale.y = lerp($CardGfx.scale.y, 1.0, delta * 16)
	
	if Player.selectedCard == self:
		pickupAnim = -50
	else:
		pickupAnim = 0
	
	# If the card has no slot then it goes to it, also happens when its slot changes
	if parentSlot != null:
		parentSlot.occupied = true
		position.x = lerp(position.x, parentSlot.global_position.x, delta * 16)
		position.y = lerp(position.y, parentSlot.global_position.y, delta * 16)
		slotted = true
	else :
		slotted = false
	
	if attackTimer > 0:
		attackAnim = -sin(attackTimer) * 20
		attackTimer -= delta
	
	$CardGfx.position.y = lerp($CardGfx.position.y, originalSpritePosition.y + pickupAnim, delta * 16) + attackAnim
	prevParentSlot = parentSlot


# Tells the player they are hovering over this object
func _on_area_2d_mouse_entered():
	mouseHover = true
	Player.currentlyHovered = self

func _on_area_2d_mouse_exited():
	mouseHover = false
	if Player.currentlyHovered == self:
		Player.currentlyHovered = null

# This tells all attached components to "tick" themselves
func tick_turn():
	if slotted:
		card_ticked.emit()

# The shittiness applies to this too
func playAttackAnimation():
	attackTimer = 0.5
