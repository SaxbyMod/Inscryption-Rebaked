using Godot;
using System;

public class ButtonLogic : Node
{
public override void _Ready()
{
	var button = new Button();
	button.Text = "Click me";
	if button.Pressed
	AddChild(button);
}

private void ButtonPressed()
{
	GD.Print("Hello world!");
}
}
