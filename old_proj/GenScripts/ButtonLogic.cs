using System;
using Godot;

// If Clicked react by bobbing up and down

public class LoadingHandler : Node2D // Only godot node can be added to the tree so we have to extend one
{
	public override void _Input(InputEvent inputEvent)
	{
		if (inputEvent.IsActionPressed("IAmPressed"))
		{
			CurrentX = Sprite.X
			CurrentY = Sprite.Y
			Sprite.MovePosition(currentX, +5)
			Sprite.MovePosition(currentX, +5)
			Sprite.MovePosition(currentX, +5)
			Sprite.MovePosition(currentX, -5)
			Sprite.MovePosition(currentX, -5)
			Sprite.MovePosition(currentX, -5)
		}
	}
}

//If placed in box react

// If unclicked react

// Change Texture depending on save data
