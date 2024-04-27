extends CharacterBody2D

var movementSpeed = 10
var rng = RandomNumberGenerator.new()

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * movementSpeed)
	var shotChance = rng.randf_range(0,100)
	if shotChance < 1:
		shoot()
	
func kill():
	queue_free()
	
func shoot():
	var bullet = preload("res://Enemy_Bullet.tscn")
	var realBullet = bullet.instantiate()
	realBullet.position = Vector2(position.x, position.y)
	get_parent().call_deferred("add_child", realBullet)
