extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Settings"):
		get_tree().change_scene_to_file("res://Scenes/deck.tscn")

# Sound Settings:
## Master
func _on_set_master_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
func _on_mute_master_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)
## SFX
func _on_set_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)
func _on_mute_sfx_toggled(toggled_on):
	AudioServer.set_bus_mute(2, toggled_on)
## Dialouge SFX
func _on_set_dialouge_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(3, value)
func _on_mute_dialouge_sfx_toggled(toggled_on):
	AudioServer.set_bus_mute(3, toggled_on)
## Ambience
func _on_set_ambience_value_changed(value):
	AudioServer.set_bus_volume_db(4, value)
func _on_mute_ambience_toggled(toggled_on):
	AudioServer.set_bus_mute(4, toggled_on)
## Music
func _on_set_music_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)
func _on_mute_music_toggled(toggled_on):
	AudioServer.set_bus_mute(1, toggled_on)
# Display Settings:

## Resolution
func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		3:
			DisplayServer.window_set_size(Vector2i(2560, 1440))
