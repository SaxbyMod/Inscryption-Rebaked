extends Sigil

func SprinterRegister() -> SigilBank:
	# Create a sigil bank
	var sigilBank = SigilBank.new()
	# Load the Icon
	var Icon : Image = Image.new()
	Icon.load("res://ModData/Art/Sigils/Sprinter.png")
	# Define the Bank
	sigilBank.name = "Sprinter"
	sigilBank.description = "During the owner's endstep, this card moves to an adjacent empty slot."
	sigilBank.category = "Movement"
	sigilBank.netacategories = []
	sigilBank.icon = ImageTexture.create_from_image(Icon)
	return sigilBank
