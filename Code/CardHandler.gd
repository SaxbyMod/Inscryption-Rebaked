extends Node

func load():
	var cardbank = FileAccess.open("res://ModData/CardBank-Vanilla.txt", FileAccess.READ)
	var content = cardbank.get_as_text()
	var newcontent = content.split("\n")
	for i in newcontent:
		if i == "Name,Flavor,Temple,Rarity,Cost[],Sigils[],Power,Health,Illus,Tribes[],LORE":
			print(0)
		else:
			print(i)
			var card = i.split(",")
			for j in card:
				print(j)

func _ready():
	load.call()
	pass
