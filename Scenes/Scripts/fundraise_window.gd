extends MarginContainer

var total_donations: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_donate_button_pressed() -> void:
	GlobalScript.gold_increase(1);
	total_donations += 1

func _on_feed_button_pressed() -> void:
	if(total_donations == 15):
		total_donations = 0

func _on_start_stream_button_pressed() -> void:
	if GlobalScript.have_enclosure == true:
		%StartStreamButton.hide()
		%LiveStreamWindow.texture = load("res://Art/livestream backgrounds/livestreambg1.png")
