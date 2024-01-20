using Godot;
using System;

public class Button : Node
{
	public override void _Ready()
	{
		// This is a way to quickly create an Array of Object
Buttons[] buttons = new buttons[]
{
  ButtonInstanceOne,
  ButtonInstanceTwo,
  ButtonInstancethree
}

// This is a way to create a new ButtonSliding while assigning its values, in that case we want to give it the list of button for it to do its job
ButtonSliding slider = new ButtonSliding() 
{
  Buttons = buttons
}

// We need to add it for the engine to call it's process method
Addchild(slider)
	}
}
