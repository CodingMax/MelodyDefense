using Godot;


public class Bullet : KinematicBody2D
{

	public bool shot = false;
	private Sprite _sprite;
	private Vector2 _initialPos;
	
	[Export] public int speed = 200;
	public Vector2 velocity = new Vector2();
	
	public void Shot()
	{
		velocity = new Vector2();
		velocity.x -= 1;
		velocity = velocity.Normalized() * speed;
	}
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_sprite = GetNode<Sprite>("Sprite");
	//	_sprite.Position = new Vector2(6,5);
		_initialPos = Position;
	}

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _PhysicsProcess(float delta)
	{
	
	Shot(); 
	var collision = MoveAndCollide(velocity * delta);
	if (collision != null)
		{
			this.Reset();
		GD.Print("Kollision");
		}
	
	}
	public void Reset()
	{
		QueueFree();

		//this.Position = _initialPos;
		//_sprite.Position = new Vector2(6,5);
		//_sprite = GetNode<Sprite>("Sprite");
		//_sprite.Position = new Vector2(0,0);
	}
	
private void _on_Wall_body_shape_exited(int body_id, object body, int body_shape, int local_shape)
{
  	if (body is Bullet bullet)
		{
			this.Reset();
			GD.Print("Kollision");
		}
}

}



/*
	private void _on_Wall_body_exited(object body)
{
	// Replace with function body.
		if (body is Bullet bullet)
		{
			this.Reset();
			GD.Print("Kollision");
		}
}


*/

