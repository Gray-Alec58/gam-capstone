extends Control



func _on_exit_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/office_scene.tscn")
