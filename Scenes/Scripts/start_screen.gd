extends Node2D


#takes player to main lobby or start of game
func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/office_scene.tscn")

#closes out of game application
func _on_exit_text_b_pressed() -> void:
	get_tree().quit()
