extends Node

var scene_id = get_tree().current_scene.name
@export var song: AudioStream
var current_track = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	if scene_id == "loading":
		current_track = "01.mp3"
	elif scene_id == "deck":
		current_track = "35.mp3"
	song = "res://Music/" + current_track
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
