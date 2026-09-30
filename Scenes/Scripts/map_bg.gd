extends Sprite2D

#When starter plot is pressed goes to building scene
func _on_starter_plot_text_b_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Building_Ui.tscn")


func _on_back_arrow_text_b_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/computer_background.tscn")
