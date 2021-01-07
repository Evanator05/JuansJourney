extends KinematicBody2D


const UP = Vector2(0,-1)
var movement = Vector2()
export var acceleration = 16
export var maxspeed = 200
export var jumpforce = 450
export var gravity = 8
var jump = 0
var doublejump = 1
var jumptimer = 0
var jumptimerreset = 10
var direction = 1
var xDir = 0
var directionprev
onready var ap = $AnimatedSprite
onready var jumpsound = $JumpSound
var walljump = 1
var onfloor
var onwall
var speedmultiplier = Vector2()
var dead = 0
onready var current_level = get_parent()


func _process(delta):
	var lkey = Input.is_action_pressed("ui_left")
	var rkey = Input.is_action_pressed("ui_right")
	var jkey = Input.is_action_just_pressed("ui_up")
	xDir = int(rkey) - int(lkey)
	
	onfloor = is_on_floor()
	onwall = is_on_wall()
	
	#walking
	movement.x += xDir*acceleration
	movement.x = clamp(movement.x,-maxspeed,maxspeed)

	if xDir:
		direction = xDir
		ap.set_animation("Juan_Walk")
	else:
		ap.set_animation("Juan_Idle")
	
	
	if direction != directionprev:
		scale.x = -1
	
	directionprev = direction
	
	#gravity
	movement.y += gravity
	

	
	#grounded
	if onfloor:
		movement.y = 0
		jump = 1
		if not xDir:
			movement.x = lerp(movement.x,0,0.2)
	
	if onwall:
		jump = 1
	
	#jump timer
	if jkey:
		jumptimer = jumptimerreset
	jumptimer -= 1
	#jumping
	if jumptimer > 0 and jump == 1:
			if onwall and not onfloor:
				movement.x = -xDir * maxspeed
			movement.y = -jumpforce
			jump = 0
			
			jumpsound.play()
	
	if dead == 1:
		get_tree().reload_current_scene()
	
	movement = move_and_slide(movement, UP)
