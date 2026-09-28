extends Control

#creating variables fro reasearch points based on button clicks
var clicks: int = 0
@onready var point_label: Label = %ResearchPointLabel

#ready function for all custom functions created
func ready() -> void:
	update_score()

#exit computer screen and return to the main lobby scene
func _on_exit_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/office_scene.tscn")

#updates research points based on the amount of button clicks
func update_score() -> void:
	GlobalScript.add_points()
	clicks = 0 #resets clicks to 0 to loop through 10 clickes
	point_label.text = "Research Points: " + str(GlobalScript.points)
#when the research button is clicked, it updates the click score then calles update_score()
func _on_research_point_tex_b_pressed() -> void:
	clicks+=1
	if (clicks == 10): #threshold for research points
		update_score()
