using Godot;
using System;

public class Button : Sprite { 
	buttons[] = new buttons[]
{
  ButtonInstanceOne,
  ButtonInstanceTwo,
  ButtonInstancethree
}

ButtonSliding slider = new ButtonSliding() 
{
  Buttons = buttons
}

Addchild(slider)
}
