extends MarginContainer

@onready var chicken_rescue_window: NinePatchRect = %RescueAnimalInfo
@onready var pig_rescue_window: NinePatchRect = %RescueAnimalInfo2
@onready var confirm_window: NinePatchRect = %ConfirmUI
@onready var question_label: Label = %QuestionLabel

func _ready() -> void:
	#updates rescue window to display available animals if they are unlocked
	GlobalScript.chicken_unlocked_changed.connect(display_rescue) 
	#GlobalScript.pig_unlocked_changed.connect(display_rescue)
	if (GlobalScript.total_chickens == 4):
		%AnimalInfoLabel.text = "Max Chickens"
		%YesButton.visible = false
		%NoButton.visible = false
	display_rescue()

#display_rescue checks for enclosure to be build before buying an animal
func display_rescue() -> void:
	if (GlobalScript.have_enclosure):
		%NeedEnclosureWindow.visible = false
		chicken_rescue_window.visible = GlobalScript.chicken_unlocked
		%AnimalAmountLabel.text = str(GlobalScript.total_chickens) + "/4"
		#pig_rescue_window.visible = GlobalScript.pig_unlocked
	else:
		%NeedEnclosureWindow.visible = true
		chicken_rescue_window.visible = false

#buttons for rescuing animls
func _on_yes_button_pressed() -> void:
	confirm_window.visible = true
func _on_no_button_pressed() -> void:
	confirm_window.visible = true
	question_label.text = "Too bad. Purchase Animal?"
#needs to be adjusted based on what animal is being bought
func _on_buy_button_pressed() -> void:
	confirm_window.visible = false
	GlobalScript.gold_decrease(5) #chicken = 5, pig = 10
	GlobalScript.get_total_chicken()
	GlobalScript.rescued_chicken()
	%AnimalAmountLabel.text = str(GlobalScript.total_chickens) + "/4"
	queue_free()
func _on_no_buy_button_pressed() -> void:
	confirm_window.visible = false


#func _on_close_window_button_pressed() -> void:
	#%"RescueWindow".visible = false#
