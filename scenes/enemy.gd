extends CharacterBody3D

@onready var animation = $Node3D/Sketchfab_Scene/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setStateIdle()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setStateIdle():
	animation.play("patrick_jjk_patrick_skeleton|Idle 6", 0.1)
	
func hurt():
	animation.play("patrick_jjk_patrick_skeleton|Death 2", 0.1)


			
