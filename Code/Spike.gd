extends StaticBody2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.dead = 1
