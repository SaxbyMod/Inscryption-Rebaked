extends Sigil

func MightyLeapRegister() -> SigilBank:
	# Create a sigil bank
	var sigilBank = SigilBank.new()
	# Load the Icon
	var Icon : Image = Image.new()
	Icon.load("res://ModData/Art/Sigils/Mighty Leap.png")
	# Define the Bank
	sigilBank.name = "Mighty Leap"
	sigilBank.description = "While this card is on the field, if a card would strike the slot that this card resides within directly, it attacks this card instead."
	sigilBank.category = "Attack Modification"
	sigilBank.netacategories = []
	sigilBank.icon = ImageTexture.create_from_image(Icon)
	return sigilBank
