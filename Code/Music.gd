extends AudioStreamPlayer

@onready var scene_id = get_tree().current_scene.name
@export var song: AudioStream

# Track Registry
@onready var track1 = preload("res://Music/01.mp3")
@onready var track2 = preload("res://Music/35.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("test")
	if scene_id == "Loading":
		stream = track1
		print("load")
	elif scene_id == "Deck":
		stream = track2
		print("deck")
	playing = true
	stream_paused = false
	pass # Replace with function body.
