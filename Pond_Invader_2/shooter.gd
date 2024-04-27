extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0

var cooldown = 0.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	cooldown-=delta
	
	if Input.is_action_just_pressed("ui_accept") && cooldown <= 0:
		fireBullet()
		cooldown = 0.1

func fireBullet():
	var loadedBullet = preload("res://Bullet.tscn")
	var firedBullet = loadedBullet.instantiate()
	firedBullet.position = Vector2(position.x,0)
	get_parent().call_deferred("add_child", firedBullet)

func lose():
	get_tree().quit()
