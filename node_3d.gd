extends Node
@onready var player = $bikini_bottom_no_sky/player

func _physics_process(delta: float) -> void:
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)
