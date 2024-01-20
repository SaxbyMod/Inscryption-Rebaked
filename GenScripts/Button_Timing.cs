using Godot;
using System;

public class Button_Timing : Node2D
{
	public float SecondsBetweenSlides = 0.15f;
	public float timer = 0f;
	
	public int currentIteration = 0;

Addchild(slider)
	
public override void _Process(float delta)
{
	timer += delta;
	if (timer > SecondsBetweenSlides) {
		timer -= SecondsBetweenDraws;
		if (currentIteration < Buttons.Length)
		{
		  Button button = Buttons[currentIteration}
		  button.Target = new Vector2(59 + 190 * currentIteration, 356);
		  currentIteration++;
		}
		else
		{
		  QueueFree(); // This is how you destroy something in Godot
		}
	}
}
}
