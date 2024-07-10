extends Node2D

var occupied = false

# This makes the slot unselectable when a card is on top of it
func _process(delta):
	if occupied:
		$Area2D.hide()
	else:
		$Area2D.show()


# Tells the player they are hovering over this object
func _on_area_2d_mouse_entered():
	Player.currentlyHovered = self

func _on_area_2d_mouse_exited():
	if Player.currentlyHovered == self:
		Player.currentlyHovered = null
