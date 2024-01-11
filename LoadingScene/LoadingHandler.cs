using Godot;

namespace LoadingScene {
public class LoadingHandler : Node
{
	public override void _Process(float delta)
	{
		if (Input.IsActionJustPressed("ui_accept") || Input.IsKeyPressed((int)KeyList.Enter))
		{
			GetTree().ChangeScene("res://MainMenu/MainMenu.tscn");
		}
	}

	public override void _Input(InputEvent inputEvent)
	{
		if (inputEvent is InputEventMouseButton)
		{
			GetTree().ChangeScene("res://MainMenu/MainMenu.tscn"); 
		}
	}
}
}
