using Godot;
using System;

public class ButtonSliding : Node2D
{
	[Export]
	public Vector2 Target;
	public float SpeedMult= 3;
	
	public override void _PhysicsProcess(float delta)
	{
		float lerpDelta = delta * SpeedMult;
		Position = new Vector2(
			Mathf.Lerp(Position.x, Target.x, lerpDelta),
			Mathf.Lerp(Position.y, Target.y, lerpDelta));
	}
	
}
