extends CharacterBody2D


var bulletSpeed = 300
const JUMP_VELOCITY = -400.0

var lifeTime = 2
var lifeSpawn = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var collision = move_and_collide(Vector2.UP*delta*bulletSpeed)
	if collision and collision.get_collider().has_method("kill"):
		collision.get_collider().kill()
	if collision and collision.get_collider().has_method("takeDamage"):
		queue_free()
	
	lifeSpawn += delta
	if lifeSpawn > lifeTime:
		queue_free()

	move_and_slide()
