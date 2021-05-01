using Godot;
using System;

public class Tower : StaticBody2D
{
	//sprite : Sprite = "assets/Tower"
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	void fireWeapon() {
		
		float shotHeight =  5;
	var	newShot = new Bullet();//this.Position.x + shotHeight
	}
	 public override void _Input(InputEvent inputEvent)
	{
		if (inputEvent.IsActionPressed("a"))
		{
		   fireWeapon();
		}
	}
	
	
//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {

//  }
}
