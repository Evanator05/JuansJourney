extends KinematicBody2D

const UP = Vector2(0,-1)
var movement = Vector2()
var dir = 1
var maxspeed = 200
var acceleration = 1600
var gravity = 900
var dirprev
var jump = 0
var jumpforce = 350
func _ready():
	pass

func _process(delta):
	movement.x += dir * acceleration*delta
	movement.x = clamp(movement.x,-maxspeed,maxspeed)
	
	
	
	if dir != dirprev:
		scale.x = -1
	
	dirprev = dir
	
	
	
	movement.y += gravity*delta
	
	if is_on_floor():
		movement.y = 0
		if jump == 1:
			jump = 0
			movement.y = -jumpforce
	
	movement = move_and_slide(movement,UP)
	
func _on_EnemyDamageBox_body_entered(body):
	if body.is_in_group("Player"):
		body.dead = 1
