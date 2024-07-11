extends Node

func _input(inputEvent):
	if Input.is_action_just_pressed("Loading Scene Start"):
		get_tree().change_scene_to_file("res://Scenes/deck.tscn")
