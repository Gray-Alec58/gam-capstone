extends MarginContainer

@onready var chicken_rescue_window: NinePatchRect = %RescueAnimalInfo

func _ready() -> void:
	GlobalScript.chicken_unlocked_changed.connect(display_rescue)
	display_rescue()

func display_rescue() -> void:
	chicken_rescue_window.visible = GlobalScript.chicken_unlocked

func _on_yes_button_pressed() -> void:
	pass # Replace with function body.
func _on_no_button_pressed() -> void:
	pass # Replace with function body.
