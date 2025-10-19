extends Control

func _ready() -> void:
	# AUDIO
	$"MarginContainer/TabContainer/Sound/Master Volume/Set Master".value = Player.userConfigs.get_value("Audio", "MasterValue", 0)
	$"MarginContainer/TabContainer/Sound/Master Volume/Mute Master".button_pressed = Player.userConfigs.get_value("Audio", "MasterMute", 0)
	$"MarginContainer/TabContainer/Sound/SFX Volume/Set SFX".value = Player.userConfigs.get_value("Audio", "SFXValue", 0)
	$"MarginContainer/TabContainer/Sound/SFX Volume/Mute SFX".button_pressed = Player.userConfigs.get_value("Audio", "SFXMute", false)
	$"MarginContainer/TabContainer/Sound/Dialouge SFX/Set Dialouge SFX".value = Player.userConfigs.get_value("Audio", "DialougeValue", 0)
	$"MarginContainer/TabContainer/Sound/Dialouge SFX/Mute Dialouge SFX".button_pressed = Player.userConfigs.get_value("Audio", "DialougeMute", false)
	$"MarginContainer/TabContainer/Sound/Ambience/Set Ambience".value = Player.userConfigs.get_value("Audio", "AmbienceValue", 0)
	$"MarginContainer/TabContainer/Sound/Ambience/Mute Ambience".button_pressed = Player.userConfigs.get_value("Audio", "AmbienceMute", false)
	$"MarginContainer/TabContainer/Sound/Music/Set Music".value = Player.userConfigs.get_value("Audio", "MusicValue", 0)
	$"MarginContainer/TabContainer/Sound/Music/Mute Music".button_pressed = Player.userConfigs.get_value("Audio", "MusicMute", false)

	# DISPLAY
	$"MarginContainer/TabContainer/Display/HSplitContainer1/FullScreenCheck".button_pressed = Player.userConfigs.get_value("Display", "Fullscreen", true)
	$"MarginContainer/TabContainer/Display/HSplitContainer2/Resolution".selected = Player.userConfigs.get_value("Display", "Resolution", 2)
	
func _process(delta):
	if Input.is_action_just_pressed("Settings"):
		get_tree().change_scene_to_file("res://Scenes/deck.tscn")

# Sound Settings:
## Master
func _on_set_master_value_changed(value):
	Player.userConfigs.set_value("Audio", "MasterValue", value)
	apply_config_file()
func _on_mute_master_toggled(toggled_on):
	Player.userConfigs.set_value("Audio", "MasterMute", toggled_on)
	apply_config_file()
	
## SFX
func _on_set_sfx_value_changed(value):
	Player.userConfigs.set_value("Audio", "SFXValue", value)
	apply_config_file()
	
func _on_mute_sfx_toggled(toggled_on):
	Player.userConfigs.set_value("Audio", "SFXMute", toggled_on)
	apply_config_file()
	
## Dialouge SFX
func _on_set_dialouge_sfx_value_changed(value):
	Player.userConfigs.set_value("Audio", "DialougeValue", value)
	apply_config_file()
	
func _on_mute_dialouge_sfx_toggled(toggled_on):
	Player.userConfigs.set_value("Audio", "DialougeMute", toggled_on)
	apply_config_file()
	
## Ambience
func _on_set_ambience_value_changed(value):
	Player.userConfigs.set_value("Audio", "AmbienceValue", value)
	apply_config_file()
	
func _on_mute_ambience_toggled(toggled_on):
	Player.userConfigs.set_value("Audio", "AmbienceMute", toggled_on)
	apply_config_file()
	
## Music
func _on_set_music_value_changed(value):
	Player.userConfigs.set_value("Audio", "MusicValue", value)
	apply_config_file()
	
func _on_mute_music_toggled(toggled_on):
	Player.userConfigs.set_value("Audio", "MusicMute", toggled_on)
	apply_config_file()

# Display Settings:
## Resolution
func _on_resolution_item_selected(index):
	match index:
		0:
			Player.userConfigs.set_value("Display", "Resolution", 0)
		1:
			Player.userConfigs.set_value("Display", "Resolution", 1)
		2:
			Player.userConfigs.set_value("Display", "Resolution", 2)
		3:
			Player.userConfigs.set_value("Display", "Resolution", 3)
	apply_config_file()

## EXIT Game
func _on_button_pressed():
	get_tree().quit()

func _on_full_screen_check_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Player.userConfigs.set_value("Display", "Fullscreen", true)
	else:
		Player.userConfigs.set_value("Display", "Fullscreen", false)
	apply_config_file()

func apply_config_file():
	# DISPLAY
	var fullscreen = Player.userConfigs.get_value("Display", "Fullscreen", true)
	var resolution = Player.userConfigs.get_value("Display", "Resolution", 2)
	
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		# If the window is in fullscreen then it already is the resolution of your monitor so there's no point in showing a resolution selector
		get_tree().get_first_node_in_group("ResolutionSwitcher").visible = false
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		get_tree().get_first_node_in_group("ResolutionSwitcher").visible = true
		
		match resolution:
			0:
				get_window().size = Vector2i(1280, 720)
			1:
				get_window().size = Vector2i(1600, 900)
			2:
				get_window().size = Vector2i(1920, 1080)
			3:
				get_window().size = Vector2i(2560, 1440)
	
	#AUDIO
	AudioServer.set_bus_volume_db(0, Player.userConfigs.get_value("Audio", "MasterValue", 0))
	AudioServer.set_bus_mute(0, Player.userConfigs.get_value("Audio", "MasterMute", false))
	
	AudioServer.set_bus_volume_db(2, Player.userConfigs.get_value("Audio", "SFXValue", 0))
	AudioServer.set_bus_mute(2, Player.userConfigs.get_value("Audio", "SFXMute", false))
	
	AudioServer.set_bus_volume_db(3, Player.userConfigs.get_value("Audio", "DialougeValue", 0))
	AudioServer.set_bus_mute(3, Player.userConfigs.get_value("Audio", "DialougeMute", false))
	
	AudioServer.set_bus_volume_db(4, Player.userConfigs.get_value("Audio", "AmbienceValue", 0))
	AudioServer.set_bus_mute(4, Player.userConfigs.get_value("Audio", "AmbienceMute", false))
	
	AudioServer.set_bus_volume_db(1, Player.userConfigs.get_value("Audio", "MusicValue", 0))
	AudioServer.set_bus_mute(1, Player.userConfigs.get_value("Audio", "MusicMute", false))
	
	Player.userConfigs.save("user://settings.cfg")
	
func _on_ready() -> void:
	Player.userConfigs.get("user://settings.cfg")
	# Work on this more later
