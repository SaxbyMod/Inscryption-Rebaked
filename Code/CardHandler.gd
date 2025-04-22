extends Node

func CardHandler():
	var path = FileAccess.open("res://ModData/CardBank-Vanilla.txt", FileAccess.READ)
	var content = path.get_as_text()
	var newcontent = content.split("\n")
	var CardBank = CardBank.new()
	var List: ItemList
	for i in newcontent:
		if i == "Name,Flavor,Temple,Rarity,Cost[],Sigils[],Power,Health,Illus,Tribes[],LORE,Traits,Secrets,Playsound":
			print(i)
		else:
			var card = i.split(",")
			var Check: int = 0
			for j in card:
				print(j)
				if (Check == 0):
					CardBank.name = j
					Check = Check + 1
				elif (Check == 1):
					CardBank.flavor = j
					Check = Check + 1
				elif (Check == 2):
					CardBank.temple = j
					Check = Check + 1
				elif (Check == 3):
					CardBank.rarity = j
					Check = Check + 1
				elif (Check == 4):
					var cost: Array
					var h = j.split(";")
					for k in h:
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("Cost: ", "")
						var l = CoolK.split("|")
						for m in l:
							cost.append(m)
					CardBank.cost = cost
					Check = Check + 1
				elif (Check == 5):
					var sigils: Array
					var h = j.split(";")
					for k in h:
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("Sigil 1: ", "").replace("Sigil 2: ", "").replace("Sigil 3: ", "").replace("Sigil 4: ", "").replace("null", "")
						sigils.append(CoolK)
					CardBank.sigils = sigils
					Check = Check + 1
				elif (Check == 6):
					CardBank.power = j.to_int()
					Check = Check + 1
				elif (Check == 7):
					CardBank.health = j.to_int()
					Check = Check + 1
				elif (Check == 8):
					CardBank.illustrator = j
					Check = Check + 1
				elif (Check == 9):
					var tribes: Array
					var h = j.split(";")
					for k in h:
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("Tribe 1: ", "").replace("Tribe 2: ", "").replace("Tribe 3: ", "").replace("Tribe 4: ", "").replace("Tribe 5: ", "").replace("null", "")
						tribes.append(CoolK)
					CardBank.tribes = tribes
					Check = Check + 1
				elif (Check == 10):
					CardBank.lore = j
					Check = Check + 1
				elif (Check == 11):
					var traits: Array
					var h = j.split(";")
					for k in h:
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("null", "")
						traits.append(CoolK)
					CardBank.traits = traits
					Check = Check + 1
				elif (Check == 12):
					var secrets: Array
					var h = j.split(";")
					for k in h:
						var CoolK = k.replace('"', "").replace("[", "").replace("]", "").replace("null", "")
						secrets.append(CoolK)
					CardBank.secrets = secrets
					Check = Check + 1
				elif (Check == 13):
					CardBank.playsound = j
					Check = Check + 1
		List.add_item(CardBank.name, CardBank)
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
