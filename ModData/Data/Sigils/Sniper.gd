extends Node

func SniperRegister() -> SigilBank:
	# Create a sigil bank
	var sigilBank = SigilBank.new()
	# Load the Icon
	var Icon : Image = Image.new()
	Icon.load("res://ModData/Art/Sigils/Sniper.png")
	# Define the Bank
	sigilBank.name = "Sniper"
	sigilBank.description = "When this card would attack, it may strike any opposing slot."
	sigilBank.category = "Attack Modification"
	sigilBank.netacategories = []
	sigilBank.icon = ImageTexture.create_from_image(Icon)
	return sigilBank
