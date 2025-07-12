extends Node2D

class_name Card

signal card_ticked

var cardGfx : Texture2D

var cardName : String = "[NO DATA]"
var cardDesc: String = "[NO DATA]"
var illus: String = "[NO DATA]"

var cost : Array
var tribes : Array
var sigils : Array

var health : int = -1
var power : int = -1

var costInstance : PackedScene = load("res://Scenes/cost_instance.tscn")

var mouseHover = false

var originalSpritePosition : Vector2

var parentSlot : Slot
var prevParentSlot : Slot
var slotted : bool = false

# Procedural animation stuff
var pickupAnim = 0
var attackAnim = 0
var attackTimer : float = 0
var defaultScale : float = 0

var dead = false

func _ready():
	defaultScale = scale.x
	
	#Cost setup
	for n in len(cost):
		var inst : CostInstance = costInstance.instantiate()
		$CostSpawningArea.add_child(inst)
		inst.set_display(cost[n], n)
	
	#Graphics
	for n in range(1, 6):
		get_node("CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe " + str(n)).texture = null

	for n in len(tribes):
		var image : Image = Image.new()
		image.load("res://ModData/Art/Tribes/" + tribes[n] + ".png")
		var tribe1 : Texture2D = ImageTexture.create_from_image(image)
		get_node("CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe " + str(n+1)).texture = tribe1
	

	for n in range(1, 5):
		get_node("CardGfx/Sigils/GridContainer/Sigil" + str(n)).texture = null

	for n in len(sigils):
		var image : Image = Image.new()
		image.load("res://ModData/Art/Sigils/" + sigils[n] + ".png")
		var sigil1 : Texture2D = ImageTexture.create_from_image(image)
		get_node("CardGfx/Sigils/GridContainer/Sigil" + str(n+1)).texture = sigil1
	
	$CardGfx/Avatar/Portrait.texture = cardGfx
	originalSpritePosition = $CardGfx.position
	
	$"CardGfx/Text Boxes/Healthbar".text = "[right]" + str(health)
	$"CardGfx/Text Boxes/Powerbar".text = str(power)
	
	$"CardGfx/Text Boxes/Text Element Defined/Illus".text = illus


func _process(delta):
	if dead:
		return
	
	mouseHover = mouse_detection()
	
	# If the card changes slots then it sets its previous slot to be unoccupied
	if parentSlot != prevParentSlot and prevParentSlot != null:
		prevParentSlot.occupied = false
	
	# If the mouse is over the tile scale it up a bit
	if mouseHover:
		scale.x = lerp(scale.x, defaultScale * 1.1, delta * 16)
		scale.y = lerp(scale.y, defaultScale * 1.1, delta * 16)
	else:
		scale.x = lerp(scale.x, defaultScale, delta * 16)
		scale.y = lerp(scale.y, defaultScale, delta * 16)
	
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
	
	$CardGfx.position.y = lerp($CardGfx.position.y, originalSpritePosition.y + pickupAnim, delta * 16) + attackAnim
	prevParentSlot = parentSlot


func mouse_detection():
	var returnValue = false
	
	var size = $MouseCollider.shape.size * defaultScale
	var pos = $MouseCollider.global_position
	
	var point1 = pos - size / 2
	var point2 = pos + size / 2
	
	var mousePos = get_global_mouse_position()
	
	if mousePos.x > point1.x && mousePos.x < point2.x:
		if mousePos.y > point1.y && mousePos.y < point2.y:
			if mouseHover == false:
				Player.currentlyHovered = self
			returnValue = true
	
	if mouseHover == true && returnValue == false:
		if Player.currentlyHovered == self:
			Player.currentlyHovered = null
	return returnValue


# Tells the player they are hovering over this object
func _on_area_2d_mouse_entered():
	print("ajkdajdl")
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
