extends Sprite2D


func _process(delta):
	#position.x = lerp(position.x, float((CardManager.damage - 5) * 9), 0.5)
	if (CardManager.damage - 5) * 9 != position.x and $ScaleMoveTimer.time_left == 0:
		print("Difference: ", (CardManager.damage - 5) * 9 - position.x)
		$ScaleMoveTimer.start()
	
	position.x = clamp(position.x, -45, 45)

func _on_scale_move_timer_timeout():
	if position.x < 45 and position.x > -45:
		position.x += clamp((CardManager.damage - 5) * 9 - position.x, -9, 9)
