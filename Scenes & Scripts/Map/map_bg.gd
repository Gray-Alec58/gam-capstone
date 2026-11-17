extends Sprite2D

var office_scene: String = "uid://xh0dirwa0e74"
var animal_stats: String = "uid://dqx3xidf862li"
var computer_background: String = "uid://dkkh4kltexgbk"
var building_ui: String = "uid://cthr2a1esflqo"

#When starter plot is pressed goes to scene depending on previous scene
func _on_starter_plot_text_b_pressed() -> void:
	var previous_path = GlobalScript.get_previous_scene_path()
	match previous_path:
		office_scene:
			GlobalScript.open_scene(animal_stats)
		computer_background:
			GlobalScript.open_scene(building_ui)

#When back arrow is pressed goes to previous scene
func _on_back_arrow_text_b_pressed() -> void:
	GlobalScript.go_back()
