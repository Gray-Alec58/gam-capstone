extends Sprite2D


#When starter plot is pressed goes to building scene
func _on_starter_plot_text_b_pressed() -> void:
	if GlobalScript.previous_scene_path !="":
		GlobalScript._go_to_scene("res://Scenes/Animal_Stats.tscn")
	else:
		GlobalScript._go_to_scene("res://Scene/Building_Ui.tscn")
	

#When back arrow is pressed goes to previous scene
func _on_back_arrow_text_b_pressed() -> void:
	if GlobalScript.previous_scene_path !="":
		GlobalScript._go_to_previous_scene()
	else:
		get_tree().change_scene_to_file("res://Scenes/computer_background.tscn")
