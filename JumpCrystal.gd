extends StaticBody2D

var active = 1
var maxtimer = 5*144
var timer = maxtimer
onready var sprite = $JumpCrystalSprite
func _ready():
	pass

func _process(delta):
	if not active:
		timer -= 1
	if timer < 0:
		active = 1
		timer = maxtimer
		sprite.frame = 0

func _on_JumpCrystelBox_body_entered(body):
	if active:
		if body.is_in_group("Player"):
			active = 0
			body.jump = 1
			sprite.frame = 1
