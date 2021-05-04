using Godot;
using System;

public class Tower : StaticBody2D
{
	PackedScene bullet;
	
	//sprite : Sprite = "assets/Tower"
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	void fireWeapon() {
		bullet = (PackedScene)ResourceLoader.Load("res://Bullet.tscn");
		Bullet newBullet = (Bullet)bullet.Instance();
		base.AddChild(newBullet);
		var x = newBullet.GetChildCount;
	GD.Print(x);
	//base.newBullet.shot = true;
	//var	newShot = new Bullet();
	}
	 public override void _Input(InputEvent inputEvent)
	{
		if (inputEvent.IsActionPressed("a"))
		{
			GD.Print("Shot");
		   fireWeapon();
		}
	}
	
	
//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {

//  }
}
