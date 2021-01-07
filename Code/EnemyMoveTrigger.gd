extends StaticBody2D

export var direction = 1

func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		body.dir = direction
