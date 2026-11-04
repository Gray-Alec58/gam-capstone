extends MarginContainer

var total_donations: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

#needs to change
func _on_donate_button_pressed() -> void:
	GlobalScript.gold_increase(1);
	total_donations += 1

#feed button gives a boost in animal happiness and increases donations
func _on_feed_button_pressed() -> void:
	if(total_donations == 15):
		total_donations = 0

func _on_start_stream_button_pressed() -> void:
	if GlobalScript.have_enclosure == true:
		%StartStreamButton.hide()
		%LiveStreamWindow.texture = load("res://Art/livestream backgrounds/livestreambg1.png") #changes background of live stream window to lowest tier of enclosure
		#upgrades based on the highest upgrade of enclosure 
