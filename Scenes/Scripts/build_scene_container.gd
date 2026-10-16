extends MarginContainer

func _on_plot_1_pressed() -> void:
	%BuildWindowTab.visible = true

func _on_back_arrow_text_b_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Map_Scene.tscn")

@onready var confirm_window: NinePatchRect = %ConfirmWindow
@onready var question_label: Label = %QuestionLabel
func _on_s_enclosure_button_pressed() -> void:
	print("Button Click")
	confirm_window.visible = true
func _on_y_build_button_pressed() -> void:
	if (GlobalScript.gold >= 25):
		GlobalScript.have_enclosure = true
		confirm_window.visible = false
		GlobalScript.gold -= 25
		get_tree().change_scene_to_file("res://Scenes/office_scene.tscn")
	else:
		question_label.text = "Not Enough Gold"
func _on_n_build_button_pressed() -> void:
	confirm_window.visible = false
