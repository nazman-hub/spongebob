extends Node
@onready var player = $bikini_bottom_no_sky/player
@onready var teleport = $bikini_bottom_no_sky/Marker3D

func _physics_process(delta: float) -> void:
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		player.global_position = teleport.get_global_transform().origin
