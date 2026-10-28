extends Sprite2D


#When starter plot is pressed goes to scene depending on previous scene
func _on_starter_plot_text_b_pressed() -> void:
	var previous_path = GlobalScript.get_previous_scene_path()
	match previous_path:
		"res://Scenes/office_scene.tscn":
			GlobalScript.open_scene("res://Scenes/Animal_Stats.tscn")
		"res://Scenes/computer_background.tscn":
			GlobalScript.open_scene("res://Scenes/Building_Ui.tscn")

#When back arrow is pressed goes to previous scene
func _on_back_arrow_text_b_pressed() -> void:
	GlobalScript.go_back()
