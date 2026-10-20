extends MarginContainer

var total_donations: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_donate_button_pressed() -> void:
	GlobalScript.gold_increase(1);
	total_donations += 1

func _on_feed_button_pressed() -> void:
	if(total_donations == 15):
		total_donations = 0
