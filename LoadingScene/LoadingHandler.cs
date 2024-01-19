using System;
using Godot;

public class LoadingHandler : Node2D // Only godot node can be added to the tree so we have to extend one
{
	public override void _Input(InputEvent inputEvent)
	{
		if (inputEvent.IsActionPressed("LoadingSceneKeysPushed"))
		{
			GetTree().ChangeScene("res://Main Menu/MainMenu.tscn");
		}
	}
}
