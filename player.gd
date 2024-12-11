extends CharacterBody3D


const SPEED = 2.0
const JUMP_VELOCITY = 4

@onready var neck := $neck
@onready var camera := $neck/Camera3D
@onready var anim_player = $AnimationPlayer


func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode (Input. MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode (Input. MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp (camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
		
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		anim_player.play("attack", 0.05)
		
func playIdle():
	anim_player.play("idle", 0.05)
		



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()






	
func attack():
	var enemies = $neck/Camera3D/hitbox.get_overlapping_bodies()
	for enemy in enemies:
		print(enemy)
		if enemy.has_method("hurt"):
			print("aa")
			enemy.hurt()
