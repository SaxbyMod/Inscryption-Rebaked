extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Settings"):
		get_tree().change_scene_to_file("res://Scenes/deck.tscn")

# Sound Settings:

## Volume Slider [Master]
func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)

## Mute [Master]
func _on_check_box_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)

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
