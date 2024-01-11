using Godot;

public class ButtonGenerator : Node2D
{
	const int BUTTON_WIDTH = 172;
	const int BUTTON_HEIGHT = 236; 
	const int GAP = 6;
	
	public override void _Ready()
	{
		Texture texture = ResourceLoader.Load("res://Assets/MainMenuButtons.png") as Texture;

		Sprite button1 = new Sprite
		{
			Texture = texture,
			RegionEnabled = true,
			RegionRect = new Rect2(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)
		};
		AddChild(button1);

		Sprite button2 = new Sprite
		{
			Texture = texture,
			RegionEnabled = true,
			RegionRect = new Rect2(0, BUTTON_HEIGHT + GAP, BUTTON_WIDTH, BUTTON_HEIGHT)
		};
		AddChild(button2);

		Sprite button3 = new Sprite
		{
			Texture = texture,
			RegionEnabled = true,
			RegionRect = new Rect2(0, 2 * BUTTON_HEIGHT + 2 * GAP, BUTTON_WIDTH, BUTTON_HEIGHT)
		};
		AddChild(button3);

		Sprite button4 = new Sprite
		{
			Texture = texture,
			RegionEnabled = true,
			RegionRect = new Rect2(0, 3 * BUTTON_HEIGHT + 3 * GAP, BUTTON_WIDTH, BUTTON_HEIGHT)
		};
		AddChild(button4);
	}
}
