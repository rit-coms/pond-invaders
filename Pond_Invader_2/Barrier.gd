extends CharacterBody2D

var health = 20

func takeDamage():
	if health <=0:
		queue_free()
	health -= 1
