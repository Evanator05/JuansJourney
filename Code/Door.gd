extends StaticBody2D

onready var sprite = $DoorSpriteSheet
onready var currentlevel = get_parent()

export var world = "0"
export var level = "0"


func _on_OpenAnimation_body_entered(body):
	if body.is_in_group("Player"):
		sprite.frame = 2


func _on_LevelChange_body_entered(body):
	if body.is_in_group("Player"):
		var scene_file = "res://Levels/" + str(world) + "/" + str(level) + ".tscn"
		get_tree().change_scene(scene_file)


func _on_OpenAnimation_body_exited(body):
	if body.is_in_group("Player"):
		sprite.frame = 1
