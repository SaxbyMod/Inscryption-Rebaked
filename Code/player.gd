extends Node

var selectedCard : Card
var currentlyHovered : Node2D

var levels = [1,3,3]

var userConfigs : ConfigFile = ConfigFile.new()

func _ready() -> void:
	if FileAccess.file_exists("user://settings.cfg"):
		userConfigs.load("user://settings.cfg")
	else:
		# If the config file doesn't exist yet then set default values into it and create it
		userConfigs.set_value("display", "fullscreen", true)
		userConfigs.set_value("display", "resolution", Vector2i(1920, 1080))
		
		Player.userConfigs.set_value("Audio", "MasterValue", 0)
		Player.userConfigs.set_value("Audio", "MasterMute", false)
		Player.userConfigs.set_value("Audio", "SFXValue", 0)
		Player.userConfigs.set_value("Audio", "SFXMute", false)
		Player.userConfigs.set_value("Audio", "DialougeValue", 0)
		Player.userConfigs.set_value("Audio", "DialougeMute", false)
		Player.userConfigs.set_value("Audio", "AmbienceValue", 0)
		Player.userConfigs.set_value("Audio", "AmbienceMute", false)
		Player.userConfigs.set_value("Audio", "MusicValue", 0)
		Player.userConfigs.set_value("Audio", "MusicMute", false)
		
		userConfigs.save("user://settings.cfg")
	
	var fullscreen = Player.userConfigs.get_value("display", "fullscreen", true)
	var resolution = Player.userConfigs.get_value("display", "resolution", Vector2i(1920, 1080))
	
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(resolution)


func _process(delta):
	if get_tree().current_scene != null:
		if not get_tree().current_scene.is_in_group("cardPlayer"):
			return
			
	if Input.is_action_just_pressed("Settings"):
		get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
	
	if Input.is_action_pressed("Exit Button"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("Left Click"):
		if currentlyHovered != null:
			# If we click a selected card then we should unselect it
			if currentlyHovered == selectedCard:
				selectedCard = null
				return
			
			# If we hover over a card we should select it
			if currentlyHovered.is_in_group("card"):
				if not currentlyHovered.slotted:
					selectedCard = currentlyHovered
			
			# If we hover over a slot and have a selected card then we should put our card there
			if currentlyHovered.is_in_group("slot") and selectedCard != null:
				if not currentlyHovered.enemy:
					play_card()
	
	if Input.is_action_just_pressed("Right Click"):
		print("Does nothing right now.")
	
	if Input.is_action_just_pressed("Spacebar"):
		CardManager.advance_turn()

func play_card():
	selectedCard.parentSlot = currentlyHovered
	selectedCard = null
