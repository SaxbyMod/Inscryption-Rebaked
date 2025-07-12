extends Node2D

class_name Card

signal card_ticked

var cardGfx : Texture2D
var cardName : String = "[NO DATA]"
var cardDesc: String = "[NO DATA]"

var cost : Array

var health : int = -1
var power : int = -1
var enemyCard = false

var blood : AtlasTexture = load("res://Art/blood_icon.tres")
var bone : AtlasTexture = load("res://Art/bone_icon.tres")
var energy : AtlasTexture = load("res://Art/energy_icon.tres")
var emerald : AtlasTexture = load("res://Art/emerald_icon.tres")
var ruby : AtlasTexture = load("res://Art/ruby_icon.tres")
var sapphire : AtlasTexture = load("res://Art/sapphire_icon.tres")
var onyx : AtlasTexture = load("res://Art/onyx_icon.tres")

var mouseHover = false

var originalSpritePosition : Vector2

var parentSlot : Slot
var prevParentSlot : Slot
var slotted : bool = false

var pickupAnim = 0
# This is a very shitty solution and should be redone with proper animations
var attackAnim = 0
var attackTimer : float = 0

var direction = 1

var dead = false

func _ready():
	for item in cost:
		var costNew : String = item
		var costNewCheck : int = costNew.split(" ").size()
		if costNewCheck == 0:
			$CardGfx/CostDisplay.queue_free()
			continue
		var costNum = costNew.split(" ")[0]
		var costType = costNew.split(" ")[1]
		if costType.to_lower() == "bones" || costType.to_lower() == "bone":
			$CardGfx/CostDisplay/Cost.texture = bone
			$CardGfx/CostDisplay/Number.text = "x" + str(costNum)
		if costType.to_lower() == "blood":
			$CardGfx/CostDisplay/Cost.texture = blood
			$CardGfx/CostDisplay/Number.text = "x" + str(costNum)
		if costType.to_lower() == "energy":
			$CardGfx/CostDisplay/Cost.texture = energy
			$CardGfx/CostDisplay/Number.text = "x" + str(costNum)
		if costType.to_lower() == "sapphire":
			if costNew.split(" ")[2] == "gem" || costNew.split(" ")[2] == "gems":
				$CardGfx/CostDisplay/Cost.texture = sapphire
				$CardGfx/CostDisplay/Number.text = "x" + str(costNum)
		if costType.to_lower() == "emerald":
			if costNew.split(" ")[2] == "gem" || costNew.split(" ")[2] == "gems":
				$CardGfx/CostDisplay/Cost.texture = emerald
				$CardGfx/CostDisplay/Number.text = "x" + str(costNum)
		if costType.to_lower() == "ruby":
			if costNew.split(" ")[2] == "gem" || costNew.split(" ")[2] == "gems":
				$CardGfx/CostDisplay/Cost.texture = ruby
				$CardGfx/CostDisplay/Number.text = "x" + str(costNum)
		if costType.to_lower() == "onyx":
			if costNew.split(" ")[2] == "gem" || costNew.split(" ")[2] == "gems":
				$CardGfx/CostDisplay/Cost.texture = onyx
				$CardGfx/CostDisplay/Number.text = "x" + str(costNum)
		#if costType.to_lower() == "prism" || costType.to_lower() == "prisms":
			#prismCost = costNew	
	
	$CardGfx/Avatar/Portrait.texture = cardGfx
	originalSpritePosition = $CardGfx.position
	
	$"CardGfx/Text Boxes/Healthbar".text = "[right]" + str(health)
	$"CardGfx/Text Boxes/Powerbar".text = str(power)
	
	if enemyCard:
		direction = -1


func _process(delta):
	if dead:
		return
	
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
		reparent(get_node("/root"))
		position.x = lerp(position.x, parentSlot.global_position.x, delta * 16)
		position.y = lerp(position.y, parentSlot.global_position.y, delta * 16)
		slotted = true
	else :
		slotted = false
	
	if attackTimer > 0:
		attackAnim = -sin(attackTimer) * 20
		attackTimer -= delta
	
	var direction = 1
	if enemyCard:
		direction = -1
	
	$CardGfx.position.y = lerp($CardGfx.position.y, originalSpritePosition.y + pickupAnim, delta * 16) + attackAnim * direction
	prevParentSlot = parentSlot


# Tells the player they are hovering over this object
func _on_area_2d_mouse_entered():
	if enemyCard:
		return
	
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

func takeDamage(amount : int):
	health -= amount
	if health <= 0:
		parentSlot.occupied = false
		dead = true
		queue_free()
	
	$"CardGfx/Text Boxes/Healthbar".text = "[right]" + str(health)
