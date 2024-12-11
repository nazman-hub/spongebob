extends CharacterBody3D

@onready var animation = $Node3D/Sketchfab_Scene/AnimationPlayer
@onready var nav_agent = $NavigationAgent3D
@onready var audio = $AudioStreamPlayer3D

var SPEED = 0.8
func _physics_process(delta: float) -> void:
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	velocity = new_velocity
	#walk()
	look_at(next_location)
	move_and_slide()
	
	
	
	
func update_target_location(target_location):
	nav_agent.target_position=(target_location)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setStateIdle()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func playAudio():
	audio.play()
		
func setStateIdle():
	animation.play("patrick_jjk_patrick_skeleton|Walk", 0.1)
	
func hurt():
	animation.play("patrick_jjk_patrick_skeleton|Death 2", 0.1)
	playAudio()
	
func walk():
	animation.play("patrick_jjk_patrick_skeleton|Walk", 0.1)



			
