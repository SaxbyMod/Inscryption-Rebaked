extends AudioStreamPlayer

@onready var scene_id = get_tree().current_scene.name
@export var song: AudioStream

# Track Registry
@onready var track1 = preload("res://Music/01.mp3")
@onready var track2 = preload("res://Music/35.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	if scene_id == "loading":
		stream.set.bind(track1)
	elif scene_id == "deck":
		stream.set.bind(track2)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
