extends Control

@onready var gold_label: Label = %GoldLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScript.gold_changed.connect(display_gold)
	display_gold()

func display_gold() -> void:
	gold_label.text = "GOLD : " + str(GlobalScript.gold)
