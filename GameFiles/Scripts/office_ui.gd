extends Control

@onready var gold_label: Label = %GoldLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScript.gold_changed.connect(display_gold)
	display_gold()

func display_gold() -> void:
	gold_label.text = "GOLD : " + str(GlobalScript.gold)

func _on_menu_button_pressed() -> void:
	%MenuWindow.visible = true

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_close_menu_button_pressed() -> void:
	%MenuWindow.visible = false
