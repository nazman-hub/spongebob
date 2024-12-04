
extends CharacterBody3D
@onready var animation_player = $AnimationPlayer
func _ready():
	await get_tree().create_timer (1).timeout
	animation_player.play("patrick_jjk_patrick_skeleton|Walk")
	#await get_tree().create_timer (100).timeout
	#animation_player.play("patrick_jjk_patrick_skeleton|Run")
