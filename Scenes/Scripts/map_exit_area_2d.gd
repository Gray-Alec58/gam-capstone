extends Area2D


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		GlobalScript.previous_scene_path = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file("res://Scenes/Map_Scene.tscn")
