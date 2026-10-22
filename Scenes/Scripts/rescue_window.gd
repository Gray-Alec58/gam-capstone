extends MarginContainer

@onready var chicken_rescue_window: NinePatchRect = %RescueAnimalInfo
@onready var pig_rescue_window: NinePatchRect = %RescueAnimalInfo2
@onready var confirm_window: NinePatchRect = %ConfirmUI
@onready var question_label: Label = %QuestionLabel

func _ready() -> void:
	GlobalScript.chicken_unlocked_changed.connect(display_rescue)
	GlobalScript.pig_unlocked_changed.connect(display_rescue)
	display_rescue()

func display_rescue() -> void:
	if (GlobalScript.have_enclosure):
		%NeedEnclosureWindow.visible = false
		chicken_rescue_window.visible = GlobalScript.chicken_unlocked
		pig_rescue_window.visble = GlobalScript.pig_unlocked
	else:
		%NeedEnclosureWindow.visible = true

func _on_yes_button_pressed() -> void:
	confirm_window.visible = true
func _on_no_button_pressed() -> void:
	confirm_window.visible = true
	question_label.text = "Too bad. Purchase Animal?"
func _on_buy_button_pressed() -> void:
	confirm_window.visible = false
	chicken_rescue_window.visible = false
	GlobalScript.gold_decrease(5)
	GlobalScript.get_total_chicken()
func _on_no_buy_button_pressed() -> void:
	confirm_window.visible = false
