extends Sprite2D






#Go back to Map scene
func _on_back_text_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Map_Scene.tscn")
