extends Node

func CardHandler() -> Dictionary:
	# Get and Access the File
	var path = FileAccess.open("res://ModData/CardBank-Vanilla.txt", FileAccess.READ)
	var content: Array
	var FileIterator = 0
	if path:
		while not path.eof_reached():
			var row = path.get_csv_line()
			# Process 'row' as needed
			content.append(row)
			FileIterator = FileIterator + 1
		content.remove_at(FileIterator - 1)
	# Define a List of cards to pass to the game later
	var List: Dictionary
	# Run as many times as there is entries in content
	for i in len(content):
		var Check: int = 0
		# Create the Cards CardBank
		var cardBank = CardBank.new()
		if i == 0:
			# We skip because this is the Info line
			continue
		else:
			# Lets get the values of the line
			var card = content[i]
			# Lets iterate over each value in the line, than define it
			for j in card:
				print(j)
				if (Check == 0):
					# Define the Name
					cardBank.name = j
				elif (Check == 1):
					# Define the flavor
					cardBank.flavor = j
				elif (Check == 2):
					# Define the Temple [May be marked obsolete later]
					cardBank.temple = j
				elif (Check == 3):
					# Define the Rarity
					cardBank.rarity = j
				elif (Check == 4):
					# Create a cost array
					var cost: Array
					# Clean the Value
					var CoolK = j.replace('"', "").replace("[", "").replace("]", "").replace("Cost: ", "")
					# Split the value by `|`
					var l = CoolK.split("|")
					# Iterate over each value in L
					for m in l:
						# Append the array for the cost
						cost.append(m)
					# Define the Cost
					cardBank.cost = cost
				elif (Check == 5):
					# Create a Sigils array
					var sigils: Array
					# Split that value by `;`
					var h = j.split(";")
					# Iterate over each value
					for k in h:
						# Clean up the value
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("Sigil 1: ", "").replace("Sigil 2: ", "").replace("Sigil 3: ", "").replace("Sigil 4: ", "").replace("null", "")
						# Append the value to the sigil array
						sigils.append(CoolK)
					# Define the Sigils
					cardBank.sigils = sigils
				elif (Check == 6):
					# Define the Power
					cardBank.power = j.to_int()
				elif (Check == 7):
					# Define the Health
					cardBank.health = j.to_int()
				elif (Check == 8):
					# Define the Illustrator
					cardBank.illustrator = j
				elif (Check == 9):
					# Define an Array for Tribes
					var tribes: Array
					# Split the value by `;`
					var h = j.split(";")
					# Iterate over each value
					for k in h:
						# Clean the value
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("Tribe 1: ", "").replace("Tribe 2: ", "").replace("Tribe 3: ", "").replace("Tribe 4: ", "").replace("Tribe 5: ", "").replace("null", "")
						# Append the value to the tribes array
						tribes.append(CoolK)
					# Define the Tribes
					cardBank.tribes = tribes
				elif (Check == 10):
					# Define the Lore
					cardBank.lore = j
				elif (Check == 11):
					# Create an Array of Traits
					var traits: Array
					# Split the Traits by `|`
					var h = j.split("|")
					# Iterate over the values
					for k in h:
						# Clean the Value
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("null", "")
						# Append the Value to traits
						traits.append(CoolK)
					# Define the Traits
					cardBank.traits = traits
				elif (Check == 12):
					# Create an Array for Secrets
					var secrets: Array
					# Split the value by `|`
					var h = j.split("|")
					# Iterate over the values
					for k in h:
						# Clean the Value
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("null", "")
						# Append the Value to Secrets
						secrets.append(CoolK)
					# Define Secrets
					cardBank.secrets = secrets
				elif (Check == 13):
					# Define the Playsound [May be marked Obselete]
					cardBank.playsound = j
				Check = Check + 1
			# Append the card to the list
			cardBank = {
			name = cardBank.name,
			flavor = cardBank.flavor,
			temple = cardBank.temple,
			rarity = cardBank.rarity,
			cost = cardBank.cost,
			sigils = cardBank.sigils,
			power = cardBank.power,
			health = cardBank.health,
			illustrator = cardBank.illustrator,
			tribes = cardBank.tribes,
			lore = cardBank.lore,
			traits = cardBank.traits,
			secrets = cardBank.secrets,
			playsound = cardBank.playsound
			}
		List[cardBank.name] = cardBank
		# Verbose logging because why not
		print("Printing Card Bank: ")
		print(cardBank.name)
		print(cardBank.flavor)
		print(cardBank.temple)
		print(cardBank.rarity)
		print(cardBank.cost)
		print(cardBank.sigils)
		print(cardBank.power)
		print(cardBank.health)
		print(cardBank.illustrator)
		print(cardBank.tribes)
		print(cardBank.lore)
		print(cardBank.traits)
		print(cardBank.secrets)
		print(cardBank.playsound)
	return List

# Define the Parent and Object
@onready var cardParent : Node2D
@export var cardObject : PackedScene

func _on_ready() -> void:
	# Fetch the List
	var List = CardHandler()
	# Iterate through the List
	var Portrait : Image = Image.new()
	for card in List:
		# Get the Parent
		cardParent = $Bestiary
		print("Testing;")
		print(card)
		var cardBank = List[card]
		print("Testing Bank;")
		print(cardBank)
		var Check = 0
		var name
		var flavor
		var temple
		var rarity
		var cost
		var sigils
		var power
		var health
		var illustrator
		var tribes
		var lore
		var traits
		var secrets
		var playsound
		for item in cardBank:
			print("testing item;")
			print(item)
			var gtem = cardBank[item]
			print ("Testing gtem;")
			print(gtem)
			if Check == 0:
				name = cardBank[item]
			if Check == 1:
				flavor = cardBank[item]
			if Check == 2:
				temple = cardBank[item]
			if Check == 3:
				rarity = cardBank[item]
			if Check == 4:
				cost = cardBank[item]
			if Check == 5:
				sigils = cardBank[item]
			if Check == 6:
				power = cardBank[item]
			if Check == 7:
				health = cardBank[item]
			if Check == 8:
				illustrator = cardBank[item]
			if Check == 9:
				tribes = cardBank[item]
			if Check == 10:
				lore = cardBank[item]
			if Check == 11:
				traits = cardBank[item]
			if Check == 12:
				secrets = cardBank[item]
			if Check == 13:
				playsound = cardBank[item]
			Check = Check + 1
			Portrait.load("res://ModData/Art/Portraits/" + name + ".png")
			
		# Define Cost
		print("Testing Cost;")
		print(cost)
		
		# Define an Entry
		var entry = cardObject.instantiate()
		entry.cardGfx = ImageTexture.create_from_image(Portrait)
		entry.cardName = name
		entry.health = health
		entry.power = power
		entry.cost = cost
		entry.illus = illustrator
		
		cardParent.add_child(entry)
