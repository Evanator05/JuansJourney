extends StaticBody2D

export var direction = 1
export var jump = 0

func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		if direction != 0:
			body.dir = direction
		if jump == 1:
			body.jump = 1
