extends Area2D

@onready var CompTransitionAnim = $ComputerTransitionAnim/AnimationPlayer

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		CompTransitionAnim.play("Fade_In")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Scenes/computer_background.tscn")
