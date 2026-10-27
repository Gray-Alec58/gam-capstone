extends Sprite2D


#When starter plot is pressed goes to building scene
func _on_starter_plot_text_b_pressed() -> void:
	GlobalScript.open_scene("res://Scenes/Animal_Stats.tscn")

#When back arrow is pressed goes to previous scene
func _on_back_arrow_text_b_pressed() -> void:
	GlobalScript.go_back()
