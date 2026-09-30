extends Control

#exit computer screen and return to the main lobby scene
func _on_exit_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/office_scene.tscn")
