extends MarginContainer


func _on_plot_1_pressed() -> void:
	%BuildWindowTab.visible = true

#Back to previous scene
func _on_back_arrow_text_b_pressed() -> void:
	GlobalScript.go_back()

@onready var confirm_window: NinePatchRect = %ConfirmWindow
@onready var question_label: Label = %QuestionLabel
func _on_s_enclosure_button_pressed() -> void:
	#print("Button Click")
	confirm_window.visible = true
func _on_y_build_button_pressed() -> void:
	if GlobalScript.have_enclosure == false:
		if (GlobalScript.gold >= 25):
			GlobalScript.have_enclosure = true
			confirm_window.visible = false
			GlobalScript.gold_decrease(25)
			%BuildWindowTab.visible = false
			GlobalScript. build_enclosure["Enclosure1"] = "small_enclosure1"
			update_Enclosure_1()
	else:
		if GlobalScript.gold < 25:
			question_label.text = "Not Enough Gold"
func _on_n_build_button_pressed() -> void:
	confirm_window.visible = false

#Keep enclosure when changing scenes
func update_Enclosure_1():
	if GlobalScript.build_enclosure.has("Enclosure1"):
		$EnclosureContainer/TopEnclosureContainer/TopRowControl/SmallEnclosure1.visible = true
func _ready():
	update_Enclosure_1()
