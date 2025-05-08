extends Node

func CardHandler():
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
		content.remove_at(FileIterator-1)
	# Define a List of cards to pass to the game later
	var List: Dictionary
	# Run as many times as there is entries in content
	for i in len(content):
		var Check: int = 0
		# Create the Cards CardBank
		var CardBank = CardBank.new()
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
					CardBank.name = j
				elif (Check == 1):
					# Define the flavor
					CardBank.flavor = j
				elif (Check == 2):
					# Define the Temple [May be marked obsolete later]
					CardBank.temple = j
				elif (Check == 3):
					# Define the Rarity
					CardBank.rarity = j
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
					CardBank.cost = cost
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
					CardBank.sigils = sigils
				elif (Check == 6):
					# Define the Power
					CardBank.power = j.to_int()
				elif (Check == 7):
					# Define the Health
					CardBank.health = j.to_int()
				elif (Check == 8):
					# Define the Illustrator
					CardBank.illustrator = j
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
					CardBank.tribes = tribes
				elif (Check == 10):
					# Define the Lore
					CardBank.lore = j
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
					CardBank.traits = traits
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
					CardBank.secrets = secrets
				elif (Check == 13):
					# Define the Playsound [May be marked Obselete]
					CardBank.playsound = j
				Check = Check + 1
			# Append the card to the list
			CardBank = {
			name = CardBank.name,
			flavor = CardBank.flavor,
			temple = CardBank.temple,
			rarity = CardBank.rarity,
			cost = CardBank.cost,
			sigils = CardBank.sigils,
			power = CardBank.power,
			health = CardBank.health,
			illustrator = CardBank.illustrator,
			tribes = CardBank.tribes,
			lore = CardBank.lore,
			traits = CardBank.traits,
			secrets = CardBank.secrets,
			playsound = CardBank.playsound
			}
			List.get_or_add(CardBank.name, CardBank)
			# Verbose logging because why not
			print("Printing Card Bank: ")
			print(CardBank.name)
			print(CardBank.flavor)
			print(CardBank.temple)
			print(CardBank.rarity)
			print(CardBank.cost)
			print(CardBank.sigils)
			print(CardBank.power)
			print(CardBank.health)
			print(CardBank.illustrator)
			print(CardBank.tribes)
			print(CardBank.lore)
			print(CardBank.traits)
			print(CardBank.secrets)
			print(CardBank.playsound)

func _ready():
	CardHandler.call()
	pass
