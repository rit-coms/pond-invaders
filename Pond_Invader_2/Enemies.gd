extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() == 0:
		var winText = preload("res://Enemy_Bullet.tscn")
		var loadedText = winText.instantiate()
		loadedText.position = Vector2(312,208)
		get_parent().call_deferred("add_child", loadedText)
