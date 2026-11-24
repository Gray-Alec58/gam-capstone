extends MarginContainer


var selected_plot_id: String = ""

func _on_plot_1_pressed() -> void:
	selected_plot_id = "Enclosure1"
	%BuildWindowTab.visible = true

func _on_plot_2_pressed() -> void:
	selected_plot_id = "Enclosure2"
	%BuildWindowTab.visible = true

func _on_plot_3_pressed() -> void:
	selected_plot_id = "Enclosure3"
	%BuildWindowTab.visible = true

func _on_plot_4_pressed() -> void:
	selected_plot_id = "Enclosure4"
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
	if selected_plot_id == "":
		return
	if GlobalScript.build_enclosure.has(selected_plot_id):
		question_label.text = "Enclosure Already Built!"
		return
	if (GlobalScript.gold >= 25):
		GlobalScript.have_enclosure = true
		confirm_window.visible = false
		GlobalScript.gold_decrease(25)
		%BuildWindowTab.visible = false
		GlobalScript.build_enclosure[selected_plot_id] = "small_enclosure1"
		update_enclosures()
	else:
		if GlobalScript.gold < 25:
			question_label.text = "Not Enough Gold"
func _on_n_build_button_pressed() -> void:
	confirm_window.visible = false

#Keep enclosure when changing scenes
func update_enclosures():
	for i in range(1,5):
		var enclosure_id = "Enclosure" + str(i)
		var enclosure_node = get_node_or_null("%SmallEnclosure" + str(i))
		if enclosure_node != null:
			if GlobalScript.build_enclosure.has(enclosure_id):
				enclosure_node.visible = true
			else:
				enclosure_node.visible = false
func _ready():
	update_enclosures()
