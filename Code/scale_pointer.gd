extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = lerp(position.x, float((CardManager.damage - 5) * 9), 0.5)
	position.x = clamp(position.x, -45, 45)
