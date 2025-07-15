extends Sigil

func AirborneRegister() -> SigilBank:
	# Create a sigil bank
	var sigilBank = SigilBank.new()
	# Load the Icon
	var Icon : Image = Image.new()
	Icon.load("res://ModData/Art/Sigils/Airborne.png")
	# Define the Bank
	sigilBank.name = "Airborne"
	sigilBank.description = "When this card would attack, it strikes the slot for direct damage instead."
	sigilBank.category = "Attack Modification"
	sigilBank.netacategories = []
	sigilBank.icon = ImageTexture.create_from_image(Icon)
	return sigilBank

func test():
	print("----------------------------------------------Overwrite")
