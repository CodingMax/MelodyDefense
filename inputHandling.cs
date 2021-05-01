using Godot;
using System;

public class inputHandling : Node
{
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	public override void _Input(InputEvent inputEvent)
	{
		if (inputEvent.IsActionPressed("jump"))
		{
		   
		}
	}

	public override void _PhysicsProcess(float delta)
	{
		if (Input.IsActionPressed("move_right"))
		{
			// Move as long as the key/button is pressed.
			
		}
	}
//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
