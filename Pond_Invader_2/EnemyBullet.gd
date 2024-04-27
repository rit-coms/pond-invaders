extends Area2D
var speed = 10
func _physics_process(delta):
	position.y+=speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method("lose"):
		body.lose()
		queue_free()
	if body.has_method("takeDamage"):
		body.takeDamage()
		queue_free()

