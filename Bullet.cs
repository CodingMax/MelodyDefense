using Godot;


public class Bullet : KinematicBody2D
{
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
	

		//public Shot(float positionY)
		//	 {Position.y = positionY;}


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_sprite = GetNode<Sprite>("Sprite");
		_sprite.Position = new Vector2(6,5);
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
	//GD.Print(collision.collider.name);
	} 
	velocity = MoveAndSlide(velocity);
	//	this.Position.y += speed * delta;
		//this.move_and_collide(Vector2 Position, infinite_inertia = true, exclude_raycast_shapes = true, test_only = false);
	//  this.Shot();
	 // velocity = MoveAndSlide(velocity);
	
	
}
	public void Reset()
	{
		Position = _initialPos;
		_sprite.Position = new Vector2(6,5);
	}
}
