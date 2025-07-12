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
var enemyCard = false

var blood : AtlasTexture = load("res://Art/blood_icon.tres")
var bone : AtlasTexture = load("res://Art/bone_icon.tres")
var energy : AtlasTexture = load("res://Art/energy_icon.tres")
var emerald : AtlasTexture = load("res://Art/emerald_icon.tres")
var ruby : AtlasTexture = load("res://Art/ruby_icon.tres")
var sapphire : AtlasTexture = load("res://Art/sapphire_icon.tres")
var onyx : AtlasTexture = load("res://Art/onyx_icon.tres")

var costInstance : PackedScene = load("res://Scenes/cost_instance.tscn")

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
	for n in len(cost):
		var inst : CostInstance = costInstance.instantiate()
		$CostSpawningArea.add_child(inst)
		inst.set_display(cost[n], n)
	
	var tribeempty : Image = Image.new()
	tribeempty.load("res://Art/Empty-Tribe.png")
	var tribeemptygfx : Texture2D = ImageTexture.create_from_image(tribeempty)
	$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 1".texture = tribeemptygfx
	$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 2".texture = tribeemptygfx
	$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 3".texture = tribeemptygfx
	$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 4".texture = tribeemptygfx
	$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 5".texture = tribeemptygfx
	var countup = 0
	for n in len(tribes):
		countup += 1
		if countup == 1:
			var image : Image = Image.new()
			image.load("res://ModData/Art/Tribes/" + tribes[n] + ".png")
			var tribe1 : Texture2D = ImageTexture.create_from_image(image)
			$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 1".texture = tribe1
		if countup == 2:
			var image : Image = Image.new()
			image.load("res://ModData/Art/Tribes/" + tribes[n] + ".png")
			var tribe2 : Texture2D = ImageTexture.create_from_image(image)
			$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 2".texture = tribe2
		if countup == 3:
			var image : Image = Image.new()
			image.load("res://ModData/Art/Tribes/" + tribes[n] + ".png")
			var tribe3 : Texture2D = ImageTexture.create_from_image(image)
			$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 3".texture = tribe3
		if countup == 4:
			var image : Image = Image.new()
			image.load("res://ModData/Art/Tribes/" + tribes[n] + ".png")
			var tribe4 : Texture2D = ImageTexture.create_from_image(image)
			$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 4".texture = tribe4
		if countup == 5:
			var image : Image = Image.new()
			image.load("res://ModData/Art/Tribes/" + tribes[n] + ".png")
			var tribe5 : Texture2D = ImageTexture.create_from_image(image)
			$"CardGfx/Text Boxes/Text Element Defined/Tribe Holder/Tribe Container/Tribe 5".texture = tribe5
	
	$CardGfx/Avatar/Portrait.texture = cardGfx
	originalSpritePosition = $CardGfx.position
	
	$"CardGfx/Text Boxes/Healthbar".text = "[right]" + str(health)
	$"CardGfx/Text Boxes/Powerbar".text = str(power)
	
	$"CardGfx/Text Boxes/Text Element Defined/Illus".text = illus
	
	
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
