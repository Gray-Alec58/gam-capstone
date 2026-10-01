extends MarginContainer

#creating variables for reasearch points based on button clicks

var clicks: int = 0
@export var animal_button_1: Button
@export var confirm_popup: NinePatchRect
@export var fact_popup: NinePatchRect
@onready var point_label: Label = %ResearchPointLabel
@onready var question_label: Label = %QuestionUI
@onready var animal_fact_label: Label = %AnimalFact

#ready function for all custom functions created
func _ready() -> void:
	question_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	question_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	update_score()
	is_unlocked()

#updates research points based on the amount of button clicks
func update_score() -> void:
	point_label.text = "Research Points: " + str(GlobalScript.points)
#when the research button is clicked, it updates the click score then calles update_score()
func _on_research_point_tex_b_pressed() -> void:
	clicks+=1
	if (clicks == 10): #threshold for research points
		GlobalScript.add_points()
		clicks = 0 #resets clicks to 0 to loop through 10 clickes
		update_score()

#on animal button click for chicken, ask user if they want to unlock the button
func _on_animal_button_1_pressed() -> void:
	question_label.text = "Unlock Chicken (5 Research Points)"
	animal_fact_label.text = "Studies show that young chicks can demonstrate basic arithmetic and understand mental number lines."
	if (GlobalScript.chicken_unlocked == false):
		confirm_popup.visible = true
		fact_popup.visible = false
	if(GlobalScript.chicken_unlocked == true):
		confirm_popup.visible = false
		fact_popup.visible = true
		
func _on_yes_button_pressed() -> void:
	if(GlobalScript.points >= 5): #change to five after testing
		GlobalScript.points -= 5 #change to five after testing
		GlobalScript.unlock_chicken()
		point_label.text = "Research Points: " + str(GlobalScript.points)
		animal_button_1.icon = null
		confirm_popup.visible = false
	else:
		question_label.text = "Not Enough Research Points"
func _on_no_button_pressed() -> void:
	confirm_popup.visible = false
func is_unlocked() -> void:
	if (GlobalScript.chicken_unlocked == true):
		animal_button_1.icon = null
