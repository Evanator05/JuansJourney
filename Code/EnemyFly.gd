extends KinematicBody2D

var movement = Vector2()
var dir = 1
var maxspeed = 200
var acceleration = 1600
var gravity = 900
var xdirprev
var xdir = 1

func _ready():
	pass

func _process(delta):
	movement.y += dir * acceleration
	movement.y = clamp(movement.y,-maxspeed,maxspeed)
	
	
	movement = move_and_slide(movement)

func _on_EnemyDamageBox_body_entered(body):
	if body.is_in_group("Player"):
		body.dead = 1
